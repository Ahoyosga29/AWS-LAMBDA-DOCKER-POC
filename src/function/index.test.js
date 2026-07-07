// Importamos el sistema de pruebas incluido en Node.js.
const test = require("node:test");

// Importamos funciones para comprobar resultados.
const assert = require("node:assert/strict");

// Importamos el handler que queremos probar.
const { handler } = require("./index");

// Definimos una prueba y le asignamos una descripción.
test("handler returns a successful response", async () => {
  // Simulamos el evento que AWS enviaría a la Lambda.
  const event = {
    name: "Alex"
  };

  // Ejecutamos el handler y esperamos su respuesta.
  const response = await handler(event);

  // El body llega como texto JSON; lo convertimos nuevamente en objeto.
  const body = JSON.parse(response.body);

  // Comprobamos que el código HTTP sea 200.
  assert.equal(response.statusCode, 200);

  // Comprobamos el mensaje devuelto.
  assert.equal(
    body.message,
    "Lambda funcionando correctamente"
  );

  // Comprobamos que la Lambda devolvió el mismo evento recibido.
  assert.deepEqual(body.receivedEvent, event);
});