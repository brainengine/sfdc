public class PPStaticRes {
	// Pay Request Fields
	public static final String ACTION_TYPE = 'actionType';
	public static final String CANCEL_URL = 'cancelUrl';
	public static final String CURRENCY_CODE = 'currencyCode';
	public static final String FEES_PAYER = 'feesPayer';
	public static final String IPN_NOTIFICATION_URL = 'ipnNotificationUrl';
	public static final String LOG_DEFAULT_SHIPPING_ADDRESS = 'logDefaultShippingAddress';
	public static final String MEMO = 'memo';
	public static final String PIN = 'pin';
	public static final String PREAPPROVAL_KEY = 'preapprovalKey';
	public static final String RECEIVER_LIST = 'receiverList';
	public static final String RECEIVER = 'receiver';
	public static final String REVERSE_ALL_PARALLEL_PAYMENTS_ON_ERROR = 'reverseAllParallelPaymentsOnError';
	public static final String SENDER_EMAIL = 'senderEmail';
	public static final String RETURN_URL = 'returnUrl';
	public static final String TRACKING_ID = 'trackingId';
	public static final String PAY_API = 'Pay';
	public static final String PAY_ACTION = 'PAY';
	public static final String FUNDING_TYPE = 'fundingType';
	public static final String FUNDING_TYPE_LIST = 'fundingtypeList';
	public static final String FUNDING_TYPE_INFO = 'fundingTypeInfo';
	
	// PreApproval and PreapprovalDetails Fields
	public static final String DATE_OF_MONTH = 'dateOfMonth';
	public static final String DAY_OF_WEEK = 'dayOfWeek';
	public static final String ENDING_DATE = 'endingDate';
	public static final String MAX_AMOUNT_PER_PAYMENT = 'maxAmountPerPayment';
	public static final String MAX_NUMBER_OF_PAYMENTS = 'maxNumberOfPayments';
	public static final String MAX_NUMBER_OF_PAYMENTS_PER_PERIOD = 'maxNumberOfPaymentsPerPeriod';
	public static final String MAX_TOTAL_AMOUNT_OF_ALL_PAYMENTS = 'maxTotalAmountOfAllPayments';
	public static final String PAYMENT_PERIOD = 'paymentPeriod';
	public static final String STARTING_DATE = 'startingDate';
	public static final String PIN_TYPE = 'pinType';
	public static final String PREAPPROVAL_API = 'Preapproval';
	public static final String PREAPPROVAL_DETAILS_API = 'PreapprovalDetails';
	public static final String APPROVED = 'approved';
	public static final String CUR_PAYENTS = 'curPayments';
	public static final String CUR_PAYENTS_AMOUNT = 'curPaymentsAmount';
	public static final String CUR_PERIOD_ATTEMPTS = 'curPeriodAttempts';
	public static final String CUR_PERIOD_ENDING_DATE = 'curPeriodEndingDate';
	
	
	// Refund Fields
	public static final String REFUND_INFO_LIST = 'refundInfoList';
	public static final String REFUND_STATUS = 'refundStatus';
	public static final String REFUND_NET_AMOUNT = 'refundNetAmount';
	public static final String REFUND_FEE_AMOUNT = 'refundFeeAmount';
	public static final String REFUND_GROSS_AMOUNT = 'refundGrossAmount';
	public static final String TOTAL_OF_ALL_REFUNDS = 'totalOfAllRefunds';
	public static final String REFUND_HAS_BECOME_FULL = 'refundHasBecomeFull';
	public static final String ENCRYPTED_REFUND_TRANSACTION_ID = 'encryptedRefundTransactionId';
	public static final String REFUND_TRANSACTION_STATUS = 'refundTransactionStatus';	
	public static final String REFUND_INFO = 'refundInfo';
	public static final String REFUND_API = 'Refund';
	
	// Client Details Fields.
	public static final String CLIENT_DETAILS = 'clientDetails';
	public static final String IP_ADDRESS = 'ipAddress';
	public static final String DEVICE_ID = 'deviceId';
	public static final String APPLICATION_ID = 'applicationId';
	public static final String GEO_LOCATION = 'geoLocation';
	public static final String CUSTOMER_TYPE = 'customerType';
	public static final String PARTNER_NAME = 'partnerName';
	public static final String CUSTOMER_ID = 'customerId';
	public static final String MODEL = 'model';
	
	// NvpEncoder Strings
	public static final String EQUAL = '=';
	public static final String AMPERSAND = '&';
	public static final String UTF_8 = 'UTF-8';
	
	// PaymentDetails Fields
	public static final String PAY_KEY = 'payKey';
	public static final String TRANSACTION_ID = 'transactionId';
	public static final String PAYMENT_DETAILS_API = 'PaymentDetails';
	public static final String PENDING_REFUND = 'pendingRefund';
	public static final String SENDER_TRANSACTION_STATUS = 'senderTransactionStatus';
	public static final String SENDER_TRANSACTION_ID = 'senderTransactionId';
	
	// Pay Response Fields
	public static final String PAYMENT_EXEC_STATUS = 'paymentExecStatus';
	
	// PaymentDetails Response Fields
	public static final String STATUS = 'status';
	public static final String PAYMENT_INFO_LIST = 'paymentInfoList';
	public static final String TRANSACTION_STATUS = 'transactionStatus';
	public static final String REFUNDED_AMOUNT = 'refundedAmount';
	public static final String PAYMENT_INFO = 'paymentInfo';
	
	
	// CancelPreapproval Fields
	public static final String CANCEL_PREAPPROVAL_API = 'CancelPreapproval';
	
	
	// ConvertCurrency Fields
	public static final String CONVERT_CURRENCY_API = 'ConvertCurrency';
	public static final String ESTIMATED_AMOUNT_TABLE = 'estimatedAmountTable';
	public static final String CURRENCY_CONVERSION_LIST = 'currencyConversionList';
	public static final String BASE_AMOUNT_LIST = 'baseAmountList';
	public static final String BASE_AMOUNT = 'baseAmount';
	public static final String CURRENCY_STR = 'currency';
	public static final String CURRENCY_LIST = 'currencyList';
	public static final String CONVERT_TO_CURRENCY_LIST = 'convertToCurrencyList';
	
	// PPReceiver Fields
	public static final String AMOUNT = 'amount';
	public static final String EMAIL = 'email';
	public static final String PRIMARY = 'primary';
	public static final String INVOICE_ID = 'invoiceId';
	public static final String PAYMENT_TYPE = 'paymentType';
	
	// PPRequestEnvelope Fields
	public static final String REQUEST_ENVELOPE = 'requestEnvelope';
	public static final String DETAIL_LEVEL_CODE = 'detailLevelCode';
	public static final String ERROR_LANGUAGE = 'errorLanguage';
	public static final String DEFAULT_DETAIL_LEVEL_CODE = 'ReturnAll';
	
	// ResponseEnvelope Fields
	public static final String RESPONSE_ENVELOPE = 'responseEnvelope';
	public static final String ACK = 'ack';
	public static final String CORRELATION_ID = 'correlationId';
	public static final String BUILD = 'build';
	public static final String TIME_STAMP = 'timestamp';
	
	// PPErrorData Fields
	public static final String ERROR = 'error';
	public static final String CATEGORY = 'category';
	public static final String DOMAIN = 'domain';
	public static final String ERROR_ID = 'errorId';
	public static final String EXCEPTION_ID = 'exceptionID';
	public static final String PARAMETER = 'parameter';
	public static final String SEVERITY = 'severity';
	public static final String SUBDOMAIN = 'subdomain';
	public static final String MESSAGE = 'message';
	
	// PayPal Header Fields
	public static final String PAYPAL_REQUEST_DATA_FORMAT = 'X-PAYPAL-REQUEST-DATA-FORMAT';
	public static final String PAYPAL_RESPONSE_DATA_FORMAT = 'X-PAYPAL-RESPONSE-DATA-FORMAT';
	public static final String PAYPAL_SECURITY_USERID = 'X-PAYPAL-SECURITY-USERID';
	public static final String PAYPAL_SECURITY_PASSWORD = 'X-PAYPAL-SECURITY-PASSWORD';
	public static final String PAYPAL_SECURITY_SIGNATURE = 'X-PAYPAL-SECURITY-SIGNATURE';
	public static final String PAYPAL_SERVICE_VERSION = 'X-PAYPAL-SERVICE-VERSION';
	public static final String PAYPAL_APPLICATION_ID = 'X-PAYPAL-APPLICATION-ID';
	public static final String PAYPAL_DEVICE_ID = 'X-PAYPAL-DEVICE-ID';
	public static final String PAYPAL_DEVICE_IPADDRESS = 'X-PAYPAL-DEVICE-IPADDRESS';
	public static final String PAYPAL_SECURITY_SUBJECT = 'X-PAYPAL-SECURITY-SUBJECT';
	public static final String PAYPAL_REQUEST_SOURCE = 'X-PAYPAL-REQUEST-SOURCE';
	public static final String PAYPAL_REQUEST_SOURCE_VALUE = 'FORCE_COM-Toolkit';
	public static final String NVP_FORMAT = 'NV';
	
	// Other Strings
	public static final String OPENING_BRACKET = '(';
	public static final String CLOSING_BRACKET = ')';
	public static final String DOT = '.';
	public static final String DSLASH = '\\';
	public static final String STRING_TRUE = 'true';
	public static final String STRING_FALSE = 'false';
	
	public static final String NAME = 'name';
	public static final String SALUTATION = 'salutation';
	public static final String FIRST_NAME = 'firstName'; 
	public static final String MIDDLE_NAME = 'middleName';
	public static final String LAST_NAME = 'lastName';
	public static final String SUFFIX = 'suffix'; 
	
	public static final String CREATE_ACCOUNTS_WEB_OPTIONS = 'createAccountWebOptions';
	public static final String CREATE_ACCOUNTS_WEB_OPTIONS_RETURN_URL = RETURN_URL;
	
	public static final String BUSINESS = 'business';
	public static final String BUSINESS_ADDRESS = 'businessAddress';
	public static final String BUSINESS_NAME = 'businessName';
	public static final String BUSINESS_CATEGORY = 'category';
	public static final String BUSINESS_SUBCATEGORY = 'subCategory';
	public static final String WORK_PHONE = 'workphone';

	public static final String ADDRESS = 'address';
	public static final String ADDRESS_LINE_ONE = 'line1';
	public static final String ADDRESS_LINE_TWO = 'line2';
	public static final String ADDRESS_LINE_CITY = 'city';
	public static final String ADDRESS_LINE_STATE = 'state';
	public static final String ADDRESS_LINE_POSTAL_CODE = 'postalCode';
	public static final String ADDRESS_COUNTRY_CODE = 'countryCode';

	public static final String ACCOUNT_TYPE = 'accountType'; 
	public static final String CITIZENSHIP_COUNTRY_CODE = 'citizenshipCountryCode';
	public static final String CONTACT_PHONE_NUMBER = 'contactPhoneNumber' ;
	public static final String DATE_OF_BIRTH = 'dateOfBirth' ;
	public static final String EMAIL_ADDRESS = 'emailAddress' ;
	public static final String NOTIFICATION_URL = 'notificationURL' ;
	public static final String PARTNER_FIELD1 = 'partnerField1' ;
	public static final String PARTNER_FIELD2 = 'partnerField2' ;
	public static final String PARTNER_FIELD3 = 'partnerField3' ;
	public static final String PARTNER_FIELD4 = 'partnerField4' ;
	public static final String PARTNER_FIELD5 = 'partnerField5' ;
	public static final String REFERRED_LANGUAGE_CODE = 'preferredLanguageCode';
	public static final String REGISTRATION_TYPE = 'registrationType';
	
	public static final String CREATE_ACCOUNT_API = 'CreateAccount';
	public static final String SANDBOX_EMAIL_ADDRESS = 'sandboxEmailAddress';
	public static final String CREATE_ACCOUNT_KEY = 'createAccountKey';
	public static final String EXCEC_STATUS = 'execStatus';
	public static final String REDIRECT_URL = 'redirectURL';
	
	public static final String GET_USER_AGREEMENT_API = 'GetUserAgreement';
	public static final String COUNTRY_CODE = 'countryCode';
	public static final String LANGUAGE_CODE = 'languageCode'; 

	public static final String AGREEMENT = 'agreement'; 
}