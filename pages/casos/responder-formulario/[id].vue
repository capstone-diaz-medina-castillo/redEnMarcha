<template>
    <div class="p-6 bg-gray-100 min-h-screen">
        <header class="mb-6">
            <h1 class="text-2xl font-bold text-gray-800 mb-4">Agregar Formulario</h1>
            <h2>Seleccione el formulario a responder</h2>
            <select name="formulario" id="formulario" v-model="selectedForm" @change="initializeResponses"
                class="w-full p-2 border rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500">
                <option value="" disabled>Selecciona un formulario</option>
                <option v-for="formulario in encuestas" :key="formulario.id" :value="formulario">
                    {{ formulario.name }}
                </option>
            </select>
        </header>
        <div v-if="selectedForm" class="bg-white p-6 rounded-lg shadow-md">
            <template v-for="(category, categoryName) in categorizedQuestions" :key="categoryName">
                <h3 class="text-lg font-semibold text-gray-800 mt-4 mb-2">{{ categoryName }}</h3>
                <ul>
                    <li v-for="(question, index) in category" :key="index" class="mb-4">
                        <label :for="'question-' + question.id" class="block text-gray-700 font-medium mb-2">
                            {{ question.question }}
                        </label>
                        <input :type="question.type" :id="'question-' + question.id"
                            v-model="responses.questions.find(res => res.id === question.id).response"
                            class="w-full p-2 border rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" />
                    </li>
                </ul>
            </template>
            <button @click="saveResponses"
                class="mt-4 w-full bg-indigo-600 text-white py-2 px-4 rounded-md shadow-md hover:bg-indigo-700 transition">
                Guardar Respuestas
            </button>
        </div>
    </div>
</template>

<script setup>
import { ref, computed } from 'vue';

const selectedForm = ref(null);

// Respuestas del formulario
const responses = ref({
    id: '',
    name: '',
    questions: [],
});


const categorizedQuestions = computed(() => {
    if (!selectedForm.value) return {};
    return selectedForm.value.questions.reduce((acc, question) => {
        if (!acc[question.category]) {
            acc[question.category] = [];
        }
        acc[question.category].push(question);
        return acc;
    }, {});
});

const initializeResponses = () => {
    if (selectedForm.value) {
        responses.value = {
            id: selectedForm.value.id,
            name: selectedForm.value.name,
            questions: selectedForm.value.questions.map(question => ({
                id: question.id,
                question: question.question,
                type: question.type,
                response: '',
            })),
        };
    }
};

const saveResponses = () => {
    // Agregar el formulario con las respuestas al array forms de caso
    caso.value.forms.push({ ...responses.value });
    console.log('Formulario guardado en caso:', caso.value);
    alert('Formulario guardado correctamente.');
};

definePageMeta({
    layout: 'main',
});
</script>

<style scoped>
/* Opcional: Agregar estilos personalizados si necesitas más personalización */
</style>
