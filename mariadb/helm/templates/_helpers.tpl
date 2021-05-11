{{/*
COMMENT: Custome entry added to using variable "name" from template chart.yml "{{ template "name" . }}"
*/}}

{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
