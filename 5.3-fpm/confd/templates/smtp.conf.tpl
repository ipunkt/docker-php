mailhub={{ getenv "SMTP_SERVER" }}
hostname={{ getenv "HOSTNAME" }}
FromLineOverride={{ getenv "FROM_OVERRIDE" }}
UseTLS={{ getenv "USE_TLS" }}
UseSTARTTLS={{ getenv "START_TLS" }}

{{ if gt (len (getenv "SMTP_AUTHENTICATION") ) 0 }}
AuthUser={{ getenv "SMTP_USER" }}
AuthPass={{ getenv "SMTP_PASSWORD" }}
AuthMethod={{ getenv "SMTP_AUTHENTICATION" }}
{{ end }}
