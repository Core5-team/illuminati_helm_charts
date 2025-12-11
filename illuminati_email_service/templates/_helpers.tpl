{{- define "illuminati-email-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "illuminati-email-service.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "illuminati-email-service.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "illuminati-email-service.labels" -}}
app.kubernetes.io/name: {{ include "illuminati-email-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "illuminati-email-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "illuminati-email-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}