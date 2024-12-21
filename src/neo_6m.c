#include <stdlib.h>
#include <string.h>
#include <neo_6m.h>

GPRMC_Data *init_GPRMC() {
    return (GPRMC_Data *)malloc(sizeof(GPRMC_Data));
}

void populate_GPRMC(GPRMC_Data *data, const char *time, char status, const char *latitude, char lat_dir,
                    const char *longitude, char lon_dir, float speed, float track_angle,
                    const char *date, float magnetic_variation, char mag_var_dir) {
    strcpy(data->time, time);
    data->status = status;
    strcpy(data->latitude, latitude);
    data->lat_dir = lat_dir;
    strcpy(data->longitude, longitude);
    data->lon_dir = lon_dir;
    data->speed = speed;
    data->track_angle = track_angle;
    strcpy(data->date, date);
    data->magnetic_variation = magnetic_variation;
    data->mag_var_dir = mag_var_dir;
}

void free_GPRMC(GPRMC_Data *data) {
    free(data);
}

GPVTG_Data *init_GPVTG() {
    return (GPVTG_Data *)malloc(sizeof(GPVTG_Data));
}

void populate_GPVTG(GPVTG_Data *data, float course, char ref_true, float magnetic_course, char ref_mag,
                    float speed_knots, char ref_knots, float speed_kph, char ref_kph, char status) {
    data->course = course;
    data->ref_true = ref_true;
    data->magnetic_course = magnetic_course;
    data->ref_mag = ref_mag;
    data->speed_knots = speed_knots;
    data->ref_knots = ref_knots;
    data->speed_kph = speed_kph;
    data->ref_kph = ref_kph;
    data->status = status;
}

void free_GPVTG(GPVTG_Data *data) {
    free(data);
}

GPGGA_Data *init_GPGGA() {
    return (GPGGA_Data *)malloc(sizeof(GPGGA_Data));
}

void populate_GPGGA(GPGGA_Data *data, const char *time, const char *latitude, char lat_dir, const char *longitude,
                    char lon_dir, int fix_quality, int num_satellites, float hdop, float altitude,
                    char alt_units, float geoid_height, char geoid_units) {
    strcpy(data->time, time);
    strcpy(data->latitude, latitude);
    data->lat_dir = lat_dir;
    strcpy(data->longitude, longitude);
    data->lon_dir = lon_dir;
    data->fix_quality = fix_quality;
    data->num_satellites = num_satellites;
    data->hdop = hdop;
    data->altitude = altitude;
    data->alt_units = alt_units;
    data->geoid_height = geoid_height;
    data->geoid_units = geoid_units;
}

void free_GPGGA(GPGGA_Data *data) {
    free(data);
}

GPGSA_Data *init_GPGSA() {
    return (GPGSA_Data *)malloc(sizeof(GPGSA_Data));
}

void populate_GPGSA(GPGSA_Data *data, char mode, int fix_type, const int satellites[12],
                    float pdop, float hdop, float vdop) {
    data->mode = mode;
    data->fix_type = fix_type;
    memcpy(data->satellites, satellites, 12 * sizeof(int));
    data->pdop = pdop;
    data->hdop = hdop;
    data->vdop = vdop;
}

void free_GPGSA(GPGSA_Data *data) {
    free(data);
}

GPGSV_Data *init_GPGSV() {
    return (GPGSV_Data *)malloc(sizeof(GPGSV_Data));
}

void populate_GPGSV(GPGSV_Data *data, int num_messages, int message_num, int num_satellites,
                    const int prns[4], const int elevations[4], const int azimuths[4], const int snrs[4]) {
    data->num_messages = num_messages;
    data->message_num = message_num;
    data->num_satellites = num_satellites;
    for (int i = 0; i < 4; i++) {
        data->satellites[i].prn = prns[i];
        data->satellites[i].elevation = elevations[i];
        data->satellites[i].azimuth = azimuths[i];
        data->satellites[i].snr = snrs[i];
    }
}

void free_GPGSV(GPGSV_Data *data) {
    free(data);
}

GPGLL_Data *init_GPGLL() {
    return (GPGLL_Data *)malloc(sizeof(GPGLL_Data));
}

void populate_GPGLL(GPGLL_Data *data, const char *latitude, char lat_dir, const char *longitude, char lon_dir,
                    const char *time, char status) {
    strcpy(data->latitude, latitude);
    data->lat_dir = lat_dir;
    strcpy(data->longitude, longitude);
    data->lon_dir = lon_dir;
    strcpy(data->time, time);
    data->status = status;
}

void free_GPGLL(GPGLL_Data *data) {
    free(data);
}