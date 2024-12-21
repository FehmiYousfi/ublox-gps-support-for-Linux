#include <stdint.h>

#define MAX_BUFF_LEN 255
// Structure for $GPRMC - Recommended Minimum Specific GPS Data
typedef struct {
    char time[10];           // UTC time (hhmmss)
    char status;             // Status (A = active, V = void)
    char latitude[12];       // Latitude (ddmm.mmmm)
    char lat_dir;            // Latitude direction (N/S)
    char longitude[13];      // Longitude (dddmm.mmmm)
    char lon_dir;            // Longitude direction (E/W)
    float speed;             // Speed over ground in knots
    float track_angle;       // Track angle in degrees
    char date[7];            // Date (ddmmyy)
    float magnetic_variation;// Magnetic variation
    char mag_var_dir;        // Magnetic variation direction (E/W)
} GPRMC_Data;

// Structure for $GPVTG - Course Over Ground and Ground Speed
typedef struct {
    float course;            // True course over ground
    char ref_true;           // 'T' for true course
    float magnetic_course;   // Magnetic course over ground
    char ref_mag;            // 'M' for magnetic course
    float speed_knots;       // Speed in knots
    char ref_knots;          // 'N' for knots
    float speed_kph;         // Speed in kilometers per hour
    char ref_kph;            // 'K' for km/h
    char status;             // Mode indicator (A/D/E/N)
} GPVTG_Data;

// Structure for $GPGGA - Global Positioning System Fix Data
typedef struct {
    char time[10];           // UTC time (hhmmss)
    char latitude[12];       // Latitude (ddmm.mmmm)
    char lat_dir;            // Latitude direction (N/S)
    char longitude[13];      // Longitude (dddmm.mmmm)
    char lon_dir;            // Longitude direction (E/W)
    int fix_quality;         // GPS Quality Indicator (0=Invalid, 1=GPS fix, 2=DGPS fix)
    int num_satellites;      // Number of satellites in use
    float hdop;              // Horizontal dilution of precision
    float altitude;          // Altitude above mean sea level
    char alt_units;          // Altitude units (M)
    float geoid_height;      // Height of geoid above WGS84 ellipsoid
    char geoid_units;        // Geoid height units (M)
} GPGGA_Data;

// Structure for $GPGSA - GPS DOP and Active Satellites
typedef struct {
    char mode;               // Mode (M = Manual, A = Automatic)
    int fix_type;            // Fix type (1=No fix, 2=2D fix, 3=3D fix)
    int satellites[12];      // PRNs of satellites used in the fix
    float pdop;              // Position dilution of precision
    float hdop;              // Horizontal dilution of precision
    float vdop;              // Vertical dilution of precision
} GPGSA_Data;

// Structure for $GPGSV - GPS Satellites in View
typedef struct {
    int num_messages;        // Number of messages in this sequence
    int message_num;         // Message number
    int num_satellites;      // Total number of satellites in view
    struct {
        int prn;             // Satellite PRN number
        int elevation;       // Elevation in degrees
        int azimuth;         // Azimuth in degrees
        int snr;             // Signal-to-noise ratio (0-99 dB)
    } satellites[4];         // Up to 4 satellites per GPGSV sentence
} GPGSV_Data;

// Structure for $GPGLL - Geographic Position (Latitude/Longitude)
typedef struct {
    char latitude[12];       // Latitude (ddmm.mmmm)
    char lat_dir;            // Latitude direction (N/S)
    char longitude[13];      // Longitude (dddmm.mmmm)
    char lon_dir;            // Longitude direction (E/W)
    char time[10];           // UTC time (hhmmss)
    char status;             // Status (A = valid, V = void)
} GPGLL_Data;

