#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>

#include "cssl.h"
#include "neo_6m.h"

#include <cJSON.h>
#include <cJSON_Utils.h>

#include <nmea.h>
#include <parsers/gpgll.h>
#include <parsers/gpgsa.h>
#include <parsers/gpvtg.h>
#include <parsers/gptxt.h>
#include <parsers/gpgsv.h>
#include <parsers/gprmc.c>

static int finished=0;
int counts_till_EOT = 0; 
static char temp_handler[MAX_BUFF_LEN] = {'\0'};
static char* collector_files[5] = {"GPRMC","GPGLL","GPGSA","GPVTG","GPGSV"};
char* log_path;

#include <sys/stat.h>
#include <fcntl.h>

int chr_dir(const char *dir_path) {
    struct stat st = {0};
    if (stat(dir_path, &st) == -1) {
        if (mkdir(dir_path, 0700) == -1) {
            perror("Failed to create directory");
            return -1; 
        } else {
            printf("Directory '%s' created successfully\n", dir_path);
            return 0; 
        }
    }
    printf("Directory '%s' already exists\n", dir_path);
    return 0;
}

int files_integrity_check(const char *dir_path) {
    struct stat st = {0};
    char file_path[256];
    int i;
    if(chr_dir(dir_path) <0){ return -1; }

    for (i = 0; i < 5; i++) {
        snprintf(file_path, sizeof(file_path), "%s/%s", dir_path, collector_files[i]);

        if (stat(file_path, &st) == -1) {
            int fd = open(file_path, O_CREAT | O_WRONLY, 0600); 
            if (fd == -1) {
                perror("Failed to create file");
                return -1; 
            }
            close(fd); 
            printf("File '%s' created successfully\n", file_path);
        } else {
            printf("File '%s' already exists\n", file_path);
        }
    }
    return 0; 
}
int update_file_content(const char *file_path, const char *new_content) {
    FILE *file = fopen(file_path, "w"); 
    if (file == NULL) {
        perror("Failed to open file");
        return -1; 
    }
    if (fputs(new_content, file) == EOF) {
        perror("Failed to write to file");
        fclose(file);
        return -1; // 
    }
    fclose(file);
    return 0; 
}
int update_gps_content(int i, char* gps_json_data){
        char *file_path = (char*)malloc(MAX_BUFF_LEN * sizeof(char));
        memset(file_path,'\0',MAX_BUFF_LEN);
        snprintf(file_path, MAX_BUFF_LEN, "%s/%s", log_path, collector_files[i]);
        update_file_content(file_path,gps_json_data);
        free(file_path);
}

void handle_nmea_data(char* sentence) {
    if (sentence == NULL) {
        fprintf(stderr, "Error: Null sentence provided\n");
        return;
    }
    nmea_s *data = nmea_parse(sentence, strlen(sentence), 0);
    if (data == NULL) {
        fprintf(stderr, "Error: Failed to parse NMEA sentence\n");
        return;
    }
    cJSON *json_obj = NULL;
    if (NMEA_GPRMC == data->type) {
        nmea_gprmc_s *gprmc = (nmea_gprmc_s *)data;

        json_obj = cJSON_CreateObject();
        cJSON_AddStringToObject(json_obj, "type", "GPRMC");
        cJSON_AddNumberToObject(json_obj, "year", gprmc->date_time.tm_year + 1900);
        cJSON_AddNumberToObject(json_obj, "month", gprmc->date_time.tm_mon + 1);
        cJSON_AddNumberToObject(json_obj, "day", gprmc->date_time.tm_mday);
        cJSON_AddNumberToObject(json_obj, "hours", gprmc->date_time.tm_hour);
        cJSON_AddNumberToObject(json_obj, "minutes", gprmc->date_time.tm_min);
        cJSON_AddNumberToObject(json_obj, "seconds", gprmc->date_time.tm_sec);
        
        cJSON *longitude = cJSON_CreateObject();
        cJSON_AddNumberToObject(longitude, "degrees", gprmc->longitude.degrees);
        cJSON_AddNumberToObject(longitude, "minutes", gprmc->longitude.minutes);
        cJSON_AddStringToObject(longitude, "cardinal", (char[]){gprmc->longitude.cardinal, '\0'});
        cJSON_AddItemToObject(json_obj, "longitude", longitude);

        cJSON *latitude = cJSON_CreateObject();
        cJSON_AddNumberToObject(latitude, "degrees", gprmc->latitude.degrees);
        cJSON_AddNumberToObject(latitude, "minutes", gprmc->latitude.minutes);
        cJSON_AddStringToObject(latitude, "cardinal", (char[]){gprmc->latitude.cardinal, '\0'});
        cJSON_AddItemToObject(json_obj, "latitude", latitude);

        cJSON_AddNumberToObject(json_obj, "speed_knots", gprmc->gndspd_knots);
        cJSON_AddNumberToObject(json_obj, "track_degrees", gprmc->track_deg);
        cJSON_AddNumberToObject(json_obj, "magnetic_variation", gprmc->magvar_deg);
        cJSON_AddStringToObject(json_obj, "mag_var_cardinal", (char[]){gprmc->magvar_cardinal, '\0'});
        cJSON_AddStringToObject(json_obj, "valid", gprmc->valid ? "True" : "False");

        char *json_string = cJSON_Print(json_obj);
        update_gps_content(0,json_string);
        free(json_string);
        cJSON_Delete(json_obj);
    } else if (NMEA_GPGLL == data->type) {
        nmea_gpgll_s *gpgll = (nmea_gpgll_s *)data;

        json_obj = cJSON_CreateObject();
        cJSON_AddStringToObject(json_obj, "type", "GPGLL");

        cJSON *longitude = cJSON_CreateObject();
        cJSON_AddNumberToObject(longitude, "degrees", gpgll->longitude.degrees);
        cJSON_AddNumberToObject(longitude, "minutes", gpgll->longitude.minutes);
        cJSON_AddStringToObject(longitude, "cardinal", (char[]){gpgll->longitude.cardinal, '\0'});
        cJSON_AddItemToObject(json_obj, "longitude", longitude);

        cJSON *latitude = cJSON_CreateObject();
        cJSON_AddNumberToObject(latitude, "degrees", gpgll->latitude.degrees);
        cJSON_AddNumberToObject(latitude, "minutes", gpgll->latitude.minutes);
        cJSON_AddStringToObject(latitude, "cardinal", (char[]){gpgll->latitude.cardinal, '\0'});
        cJSON_AddItemToObject(json_obj, "latitude", latitude);

        char *json_string = cJSON_Print(json_obj);
        update_gps_content(1,json_string);
        free(json_string);
        cJSON_Delete(json_obj);
    } else if (NMEA_GPGSA == data->type) {
        nmea_gpgsa_s *gpgsa = (nmea_gpgsa_s *)data;

        json_obj = cJSON_CreateObject();
        cJSON_AddStringToObject(json_obj, "type", "GPGSA");
        cJSON_AddStringToObject(json_obj, "mode", (char[]){gpgsa->mode, '\0'});
        cJSON_AddNumberToObject(json_obj, "fix_type", gpgsa->fixtype);
        cJSON_AddNumberToObject(json_obj, "pdop", gpgsa->pdop);
        cJSON_AddNumberToObject(json_obj, "hdop", gpgsa->hdop);
        cJSON_AddNumberToObject(json_obj, "vdop", gpgsa->vdop);

        char *json_string = cJSON_Print(json_obj);
        update_gps_content(2,json_string);
        free(json_string);
        cJSON_Delete(json_obj);
    } else if (NMEA_GPVTG == data->type) {
        nmea_gpvtg_s *gpvtg = (nmea_gpvtg_s *)data;

        json_obj = cJSON_CreateObject();
        cJSON_AddStringToObject(json_obj, "type", "GPVTG");
        cJSON_AddNumberToObject(json_obj, "track_deg", gpvtg->track_deg);
        cJSON_AddNumberToObject(json_obj, "speed_kmph", gpvtg->gndspd_kmph);
        cJSON_AddNumberToObject(json_obj, "speed_knots", gpvtg->gndspd_knots);

        char *json_string = cJSON_Print(json_obj);
        update_gps_content(3,json_string);
        free(json_string);
        cJSON_Delete(json_obj);
    } else if (NMEA_GPGSV == data->type) {
        nmea_gpgsv_s *gpgsv = (nmea_gpgsv_s *)data;

        json_obj = cJSON_CreateObject();
        cJSON_AddStringToObject(json_obj, "type", "GPGSV");
        cJSON_AddNumberToObject(json_obj, "num_messages", gpgsv->sentences);
        cJSON_AddNumberToObject(json_obj, "message_number", gpgsv->sentence_number);
        cJSON_AddNumberToObject(json_obj, "num_satellites", gpgsv->satellites);

        cJSON *satellite_array = cJSON_CreateArray();
        for (int i = 0; i < 4; ++i) {
            cJSON *satellite = cJSON_CreateObject();
            cJSON_AddNumberToObject(satellite, "prn", gpgsv->sat[i].prn);
            cJSON_AddNumberToObject(satellite, "elevation", gpgsv->sat[i].elevation);
            cJSON_AddNumberToObject(satellite, "azimuth", gpgsv->sat[i].azimuth);
            cJSON_AddNumberToObject(satellite, "snr", gpgsv->sat[i].snr);
            cJSON_AddItemToArray(satellite_array, satellite);
        }
        cJSON_AddItemToObject(json_obj, "satellites", satellite_array);

        char *json_string = cJSON_Print(json_obj);
        update_gps_content(4,json_string);
        free(json_string);
        cJSON_Delete(json_obj);
    }
    nmea_free(data);
}


static void callback(int id, void *buff, int length) {
    if (!buff || length <= 0) {
        fprintf(stderr, "Invalid buffer or length.\n");
        return;
    }

    uint8_t *buffer = (uint8_t *)buff;

    if (buffer[length - 1] == '\n') {
        temp_handler[counts_till_EOT] = '\0'; 

        char sentence[MAX_BUFF_LEN];
        size_t length = strlen(temp_handler);
        memcpy(sentence, temp_handler, length);
        sentence[length] = '\n';
        sentence[length+1] = '\0';
        handle_nmea_data(sentence);
        memset(temp_handler, '\0', MAX_BUFF_LEN);
        counts_till_EOT = 0;
    } else {
        if (counts_till_EOT + length < MAX_BUFF_LEN) {
            memcpy(&temp_handler[counts_till_EOT], buffer, length);
            counts_till_EOT += length;
            temp_handler[counts_till_EOT] = '\0';
        } else {
            fprintf(stderr, "Buffer overflow prevented!\n");
        }
    }
    fflush(stdout);
}

void print_usage(const char *program_name) {
    printf("Usage: %s --logpath <log_path> --device <device_path> --category <category>\n", program_name);
}

int main(int argc, char *argv[]) {
    if (argc != 7) {
        print_usage(argv[0]);
        return 1;
    }

    log_path = NULL;
    char *device_path = NULL;
    char *category = NULL;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "--logpath") == 0 && i + 1 < argc) {
            log_path = argv[i + 1];
            i++; 
        } else if (strcmp(argv[i], "--device") == 0 && i + 1 < argc) {
            device_path = argv[i + 1];
            i++; 
        } else if (strcmp(argv[i], "--category") == 0 && i + 1 < argc) {
            category = argv[i + 1];
            i++; 
        } else {
            printf("Invalid argument or missing value for '%s'.\n", argv[i]);
            print_usage(argv[0]);
            return 1; 
        }
    }

    if (log_path == NULL || device_path == NULL || category == NULL) {
        printf("Missing required parameters.\n");
        print_usage(argv[0]);
        return 1; 
    }

    printf("Log Path: %s\n", log_path);
    printf("Device Path: %s\n", device_path);
    printf("Category: %s\n", category);

    files_integrity_check(log_path);
    cssl_t *serial;
    cssl_start();
    serial=cssl_open(device_path,callback,0,9600,8,0,1);

    if (!serial) {
	printf("%s\n",cssl_geterrormsg());
	return -1;
    }
    while (!finished) {
    }
    cssl_close(serial);
    cssl_stop();

    return 0;
}