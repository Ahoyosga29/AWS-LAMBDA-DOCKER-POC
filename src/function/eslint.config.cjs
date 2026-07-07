// Importamos las reglas recomendadas oficialmente por ESLint.
const js = require("@eslint/js");

// Importamos nombres globales existentes en Node.js,
// como console, require, exports y process.
const globals = require("globals");

// Exportamos la configuración que utilizará ESLint.
module.exports = [
  // Activamos las reglas recomendadas para detectar errores comunes.
  js.configs.recommended,

  {
    // Esta configuración se aplicará a nuestros archivos JavaScript.
    files: ["**/*.js"],

    languageOptions: {
      // Indicamos que utilizamos módulos CommonJS:
      // require(), module.exports y exports.handler.
      sourceType: "commonjs",

      // Permitimos la sintaxis moderna de JavaScript.
      ecmaVersion: "latest",

      // Informamos a ESLint sobre las variables globales de Node.js.
      globals: globals.node
    },

    rules: {
      // Permitimos console.log porque sus mensajes aparecerán
      // posteriormente en CloudWatch Logs.
      "no-console": "off"
    }
  }
];