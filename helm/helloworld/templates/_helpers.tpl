{{/*
Expand the name of the chart.
*/}}
{{- define "helloworld.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" | replace "+" "-" | lower -}}
{{- end -}}

{{/*
Create a fullname using the release name and the chart name.
*/}}
{{- define "helloworld.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" | replace "+" "-" | lower -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" | replace "+" "-" | lower -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "helloworld.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | lower -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "helloworld.labels" -}}
app.kubernetes.io/name: {{ include "helloworld.name" . }}
helm.sh/chart: {{ include "helloworld.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name | replace "+" "-" | lower }}
app.kubernetes.io/managed-by: {{ .Release.Service | lower }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "helloworld.selectorLabels" -}}
app: {{ include "helloworld.name" . }}
app.kubernetes.io/instance: {{ .Release.Name | replace "+" "-" | lower }}
{{- end -}}

{{/*
Service account name
*/}}
{{- define "helloworld.serviceAccountName" -}}
{{- if .Values.serviceAccount.name -}}
{{- .Values.serviceAccount.name | lower -}}
{{- else -}}
{{ include "helloworld.fullname" . }}-sa
{{- end -}}
{{- end -}}
