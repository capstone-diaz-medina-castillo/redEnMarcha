<template>
    <div>
        <header>
            <div class="flex flex-col space-y-3">
                <h1 class="flex justify-start text-xl font-medium">Crear Caso</h1>
                <h2>Rellena los datos del caso a desarrollar</h2>
            </div>
        </header>
        <div>
            <CreateCaseStepOne v-if="step == 1" @next-step="handleNextStep1" />
            <CreateCaseStepTwo v-else-if="step == 2" @next-step="handleNextStep2" @prev-step="prevStep" />
            <div v-if="step == 3">
                <header class="mb-6">
                    <h1 class="text-xl font-bold">Vista previa del caso</h1>
                </header>
                <div class="space-y-6">
                    <!-- Profesionales Asignados -->
                    <section>
                        <h2 class="text-lg font-semibold">Profesionales Asignados</h2>
                        <div v-for="(profesional, index) in caso.assignedProfesionals" :key="index"
                            class="border rounded-lg p-4 bg-gray-50 shadow-sm">
                            <p><strong>Nombre:</strong> {{ profesional.name }}</p>
                            <p><strong>Profesión:</strong> {{ profesional.profesion }}</p>
                            <p><strong>Email:</strong> {{ profesional.email }}</p>
                        </div>
                    </section>

                    <!-- Usuarios del Caso -->
                    <section>
                        <h2 class="text-lg font-semibold">Usuarios del Caso</h2>
                        <div v-for="(user, index) in caso.userObject" :key="index"
                            class="border rounded-lg p-4 bg-gray-50 shadow-sm">
                            <p><strong>RUT:</strong> {{ user.rut }}</p>
                            <p><strong>Nombre:</strong> {{ user.name }} {{ user.lastName }}</p>
                            <p><strong>Fecha de Nacimiento:</strong> {{ user.birthDate }}</p>
                            <p><strong>Género:</strong> {{ user.gender }}</p>
                            <p v-if="user.schooling"><strong>Escolaridad:</strong> {{ user.schooling }}</p>
                            <p v-if="user.privatedDate"><strong>Fecha de Privación:</strong> {{ user.privatedDate }}</p>
                            <p v-if="user.jail"><strong>Centro Penitenciario:</strong> {{ user.jail }}</p>
                            <p v-if="user.nnaRelationship"><strong>Relación con NNA:</strong> {{ user.nnaRelationship }}
                            </p>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <footer v-if="step == 3" class="mt-6 flex  space-x-3 ">
            <button @click="prevStep" class="bg-gray-500 hover:bg-gray-700 text-white py-2 px-4 rounded-xl">
                Anterior
            </button>
            <div>
                <button @click="crearCaso" class="bg-blue-500 rounded-xl text-white py-2 px-4 ">Crear Caso</button>
            </div>
        </footer>
    </div>
</template>

<script setup>
import { ref } from 'vue';

const step = ref(1);
const caso = ref({
    createdAt: new Date(),
    updatedAt: new Date(),
    userObject: [],
    assignedProfesionals: [],
    forms: [],
});

// Manejar el paso 1
const handleNextStep1 = (users) => {
    caso.value.userObject = users;
    step.value++;
};

// Manejar el paso 2
const handleNextStep2 = (response) => {
    caso.value.assignedProfesionals = response;
    step.value++;
    console.log(caso.value);
};

// Retroceder paso
const prevStep = () => {
    step.value--;
};
const crearCaso = () => {
    console.log('Caso creado');
};
definePageMeta({ layout: 'main' });
</script>
