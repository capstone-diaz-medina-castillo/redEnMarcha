<template>
    <div class="w-full space-y-10 mt-10">
        <header>
            <h1 class="text-xl font-medium">Agregar profesional</h1>
        </header>
        <div>
            <section>
                <!-- Campos de entrada -->
                <div class="mb-4">
                    <label for="name">Nombre</label>
                    <input type="text" v-model="createProfesional.name" class="border rounded-lg p-2 w-full" />
                </div>
                <div class="mb-4">
                    <label for="name">Apellido</label>
                    <input type="text" v-model="createProfesional.second_name" class="border rounded-lg p-2 w-full" />
                </div>
                <div class="mb-4">
                    <label for="name">Correo</label>
                    <input type="text" v-model="createProfesional.email" class="border rounded-lg p-2 w-full" />
                </div>
                <div class="mb-4">
                    <label for="name">Contraseña</label>
                    <input type="text" v-model="createProfesional.password" class="border rounded-lg p-2 w-full" />
                </div>

                <!-- Campos de selección -->
                <div class="mb-4">
                    <label>Rol</label>
                    <select v-model="createProfesional.role" class="border rounded-lg p-2 w-full">
                        <option v-for="option in roles" :key="option.id" :value="option.name">
                            {{ option.name }}
                        </option>
                    </select>
                </div>
                <div class="mb-4">
                    <label>Profesión</label>
                    <select v-model="createProfesional.profesion" class="border rounded-lg p-2 w-full">
                        <option v-for="option in profesions" :key="option.id" :value="option.name">
                            {{ option.name }}
                        </option>
                    </select>
                </div>
                <!-- Botón guardar -->
                <button @click="handleUpdate" class="bg-blue-500 rounded-lg text-white px-4 py-2">Guardar</button>
            </section>
        </div>
    </div>
    <Success v-if="Popup == 'success'" @close="handleClose" ></Success>
</template>

<script setup>
import { ref } from 'vue';
import { users, profesions, roles } from '@/composables/dummyData'; // Importar directamente del composable
const Popup = ref(''); // Variable para mostrar el popup
// Crear el objeto profesional inicial
const createProfesional = ref({
    avatar: 'https://musicland.cl/wp-content/uploads/2020/09/TYLERFLOWER-800x800.jpg',
    name: '',
    second_name: '',
    email: '',
    password: '',
    role: '',
    profesion: ''
});

// Método para agregar el usuario
const handleUpdate = () => {
    console.log(createProfesional.value)
    if (
        !createProfesional.value.name ||
        !createProfesional.value.second_name ||
        !createProfesional.value.email ||
        !createProfesional.value.password ||
        !createProfesional.value.profesion ||
        !createProfesional.value.role
    ) {
        alert('Por favor completa todos los campos antes de guardar.');
        return;
    }

    // Generar un ID único para el usuario
    createProfesional.value.id = `user_${Date.now()}`;

    // Agregar el nuevo profesional al array `users`
    users.value.push({ ...createProfesional.value });
    Popup.value = 'success';
    // Limpia el formulario después de guardar
    createProfesional.value = {
        avatar: 'https://musicland.cl/wp-content/uploads/2020/09/TYLERFLOWER-800x800.jpg',
        name: '',
        second_name: '',
        email: '',
        password: '',
        role: '',
        profesion: ''
    };
};
const handleClose = () => {
    Popup.value = '';
}
definePageMeta({ layout: 'main' });
</script>

<style scoped>
.mb-4 {
    margin-bottom: 1rem;
}
</style>
