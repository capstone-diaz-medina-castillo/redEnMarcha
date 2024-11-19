<template>
    <div class="mt-10 space-y-10">
        <header class="flex justify-between w-full items-center">
            <div class="flex flex-col space-y-3">
                <h1 class="flex justify-start text-xl font-medium">Encuestas</h1>
                <h2>Aquí podrás crear y gestionar las diferentes encuestas que se podrán aplicar en los diferentes
                    casos.</h2>
            </div>
        </header>
        <div>
            <ul>
                <li v-for="encuesta in encuestas" :key="encuesta.id"
                    class="rounded-xl mb-5 font-medium text-xl border border-gray-300 p-5 transform transition-all duration-200 hover:bg-blue-700 hover:scale-105 hover:text-white">
                    <button @click="watchQuestions(encuesta)"
                        class="flex justify-between w-full items-center">
                        <h2>{{ encuesta.name }}</h2>
                        <Icons name="chevronRight" class="w-10 h-10"></Icons>
                    </button>
                </li>
            </ul>
        </div>
    </div>
    <Popup v-if="popup === 1" @close="popup = 0">
        <div class="p-5">
            <header class="mb-4">
                <h1 class="text-2xl font-semibold">Preguntas de formulario {{ formName }}</h1>
            </header>
            <div>
                <ul class="space-y-4">
                    <li v-for="question in questionsOf" :key="question.id"
                        class="bg-gray-50 p-4 rounded-lg shadow-md border border-gray-200 flex flex-col space-y-2">
                        <div class="text-lg font-medium text-gray-800">{{ question.question }}</div>
                        <div class="text-sm text-gray-500">
                            <span class="font-semibold">Tipo de dato:</span> {{ formatType(question.type) }}
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </Popup>
</template>

<script setup>
const popup = ref(0)
const questionsOf = ref([])
const formName = ref('')
const watchQuestions = (questions) => {
    questionsOf.value = questions.questions
    formName.value = questions.name
    popup.value = 1
}

// Formatea el tipo de dato para mostrarlo de forma más legible
const formatType = (type) => {
    const typeMapping = {
        text: 'Texto',
        number: 'Número',
        date: 'Fecha',
        boolean: 'Verdadero/Falso',
    }
    return typeMapping[type] || 'Desconocido'
}

definePageMeta({ layout: 'main' })
</script>
