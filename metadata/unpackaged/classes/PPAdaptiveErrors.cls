global class PPAdaptiveErrors {

    // Custom Error codes
    global static final Long ERROR_UNKNOWN_INTERNAL = 400000;
    global static final Long ERROR_INVALID_INPUT_PARAM = ERROR_UNKNOWN_INTERNAL + 1;
    global static final Long ERROR_HTTP_RESPONSE = ERROR_UNKNOWN_INTERNAL + 2;
    global static final Long ERROR_GOVERNOR_LIMITE_WEB_CALLOUT = ERROR_UNKNOWN_INTERNAL + 3;
    global static final Long ERROR_PROFILE_TYPE_UNKNOWN = ERROR_UNKNOWN_INTERNAL + 4;
    global static final Long ERROR_ENVIRONMENT_TYPE_UNKNOWN = ERROR_UNKNOWN_INTERNAL + 5;
    global static final Long ERROR_SERVICE_TYPE_UNKNOWN = ERROR_UNKNOWN_INTERNAL + 6;
    
    // Error Strings
    public static final String ERROR_STRING_UNKNOWN_INTERNAL = 'Some internal error has occurred';
    public static final String ERROR_STRING_INVALID_INPUT_PARAM = 'Input parameter can\'t be Null';
    public static final String ERROR_STRING_HTTP_RESPONSE = 'HTTP Request failed with Error Code: ';
    public static final String ERROR_STRING_GOVERNOR_LIMITE_WEB_CALLOUT = 'Governor limit for web callout has exceeded';
    public static final String ERROR_STRING_PROFILE_TYPE_UNKNOWN = 'Profile type is not specified';
    public static final String ERROR_STRING_ENVIRONMENT_TYPE_UNKNOWN = 'Environment type is not specified';
    public static final String ERROR_STRING_SERVICE_TYPE_UNKNOWN = 'Service type is not specified';
}