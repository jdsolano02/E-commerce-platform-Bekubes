import React, { useState } from 'react';

const App = () => {
  const [id, setId] = useState('');
  const [nombre, setNombre] = useState('');

  const handleSubmit = (e) => {
    e.preventDefault();

    fetch('http://localhost/Ecommerce-Gestion%20Inventario-Torneo%20Bekubes/BackEnd/Insert.php', { // Cambia la URL según la ubicación de tu archivo
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ ID: id, Nombre: nombre }), // Ajusta las claves aquí
    })
      .then((response) => {
        if (!response.ok) {
          throw new Error('Error en la solicitud');
        }
        return response.json();
      })
      .then((data) => {
        console.log('Respuesta del servidor:', data);
        alert('Datos enviados correctamente');
      })
      .catch((error) => {
        console.error('Error al enviar los datos:', error);
        alert('Ocurrió un error al enviar los datos');
      });
  };

  return (
    <div>
      <h1>Formulario</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label>ID:</label>
          <input
            type="text"
            value={id}
            onChange={(e) => setId(e.target.value)}
          />
        </div>
        <div>
          <label>Nombre:</label>
          <input
            type="text"
            value={nombre}
            onChange={(e) => setNombre(e.target.value)}
          />
        </div>
        <button type="submit">Enviar</button>
      </form>
    </div>
  );
};

export default App;