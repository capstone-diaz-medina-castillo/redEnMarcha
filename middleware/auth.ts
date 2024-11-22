export default defineNuxtRouteMiddleware((to, from) => {
    if (process.client) {
      // Asegúrate de que este código solo se ejecute en el cliente
      const myUser = localStorage.getItem('myUser');
  
      if (!myUser || myUser === '{}' || myUser === 'null') {
        return navigateTo('/iniciar-sesion'); // Redirige a la página de inicio de sesión
      }
    }
  });
  