<template>
    <div class="p-6 bg-gray-100 min-h-screen">
        <header class="mb-6">
            <h1 class="text-2xl font-bold text-gray-800 mb-4">Agregar Formulario</h1>
            <h2>Seleccione el formulario a responder</h2>
            <select name="formulario" id="formulario" v-model="selectedForm"
                class="w-full p-2 border rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500">
                <option value="" disabled>Selecciona un formulario</option>
                <option v-for="formulario in encuestas" :key="formulario.id" :value="formulario">
                    {{ formulario.name }}
                </option>
            </select>
        </header>
        <div class="bg-white p-6 rounded-lg shadow-md">
            <template v-for="(category, categoryName) in categorizedQuestions" :key="categoryName">
                <h3 class="text-lg font-semibold text-gray-800 mt-4 mb-2">{{ categoryName }}</h3>
                <ul>
                    <li v-for="(question, index) in category" :key="index" class="mb-4">
                        <label :for="'question-' + index" class="block text-gray-700 font-medium mb-2">
                            {{ question.question }}
                        </label>
                        <input :type="question.type" :id="'question-' + index" v-model="responses[index]"
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
const selectedForm = ref(null)
const responses = ref([])

const categorizedQuestions = computed(() => {
    if (!selectedForm.value) return {}
    return selectedForm.value.questions.reduce((acc, question) => {
        if (!acc[question.category]) {
            acc[question.category] = []
        }
        acc[question.category].push(question)
        return acc
    }, {})
})

const saveResponses = () => {
    console.log('Respuestas guardadas:', responses.value)
    alert('Respuestas guardadas correctamente.')
}

definePageMeta({
    layout: 'main'
})
</script>

<style scoped>
/* Opcional: Agregar estilos personalizados si necesitas más personalización */
</style>
