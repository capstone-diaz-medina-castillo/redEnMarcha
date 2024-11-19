<template>
    <div class="p-6 bg-gray-100 min-h-screen">
        <header class="mb-6">
            <h1 class="text-2xl font-bold text-gray-800 mb-4">Agregar Formulario</h1>
            <select name="formulario" id="formulario" v-model="selectedForm"
                class="w-full p-2 border rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500">
                <option value="" disabled>Selecciona un formulario</option>
                <option v-for="formulario in encuestas" :key="formulario.id" :value="formulario">
                    {{ formulario.name }}
                </option>
            </select>
        </header>
        <div class="bg-white p-6 rounded-lg shadow-md">
            <ul>
                <li v-for="(question, index) in selectedForm?.questions || []" :key="index" class="mb-4">
                    <label :for="'question-' + index" class="block text-gray-700 font-medium mb-2">
                        {{ question.question }}
                    </label>
                    <input :type="quuestion.type" :id="'question-' + index" v-model="responses[index]"
                        class="w-full p-2 border rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500" />
                </li>
            </ul>
            <button @click="saveResponses"
                class="mt-4 w-full bg-indigo-600 text-white py-2 px-4 rounded-md shadow-md hover:bg-indigo-700 transition">
                Guardar Respuestas
            </button>
        </div>
    </div>
</template>

<script setup>
import { ref } from 'vue'

const selectedForm = ref(null)
const responses = ref([])

const saveResponses = () => {
    console.log('Respuestas guardadas:', responses.value)
    alert('Respuestas guardadas correctamente.')
}
</script>

<style scoped>
/* Opcional: Agregar estilos personalizados si necesitas más personalización */
</style>
