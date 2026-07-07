// AWS Lambda buscará y ejecutará una función exportada llamada "handler".
exports.handler = async (event = {}) => {
  // "event" contiene la información que recibe la Lambda.
  // El valor "{}" se usa si invocamos el handler sin enviar un evento.
  
  // Convertimos el evento a texto para verlo claramente en los logs.
  console.log("Event received:", JSON.stringify(event));

  // API Gateway espera que la Lambda devuelva un objeto con este formato.
  return {
    // Código HTTP que recibirá el cliente.
    statusCode: 200,

    // Indicamos que el cuerpo de la respuesta contiene JSON.
    headers: {
      "content-type": "application/json"
    },

    // El body debe ser texto, no un objeto JavaScript.
    // JSON.stringify convierte el objeto en texto JSON.
    body: JSON.stringify({
      message: "Lambda funcionando correctamente",
      receivedEvent: event
    })
  };
};