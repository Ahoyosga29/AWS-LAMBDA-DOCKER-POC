# Imagen oficial de AWS Lambda con Node.js 24.
FROM public.ecr.aws/lambda/nodejs:24

# Copiamos los archivos que definen las dependencias del proyecto.
COPY src/function/package.json ${LAMBDA_TASK_ROOT}/
COPY src/function/package-lock.json ${LAMBDA_TASK_ROOT}/

# Instalamos exactamente las versiones registradas en package-lock.json.
# --omit=dev excluye dependencias usadas solamente durante el desarrollo.
RUN npm ci --omit=dev

# Copiamos el código que ejecutará la función Lambda.
COPY src/function/index.js ${LAMBDA_TASK_ROOT}/

# AWS ejecutará la exportación "handler" ubicada en index.js.
CMD ["index.handler"]
