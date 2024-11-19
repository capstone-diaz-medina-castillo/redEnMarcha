<template>
    <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-blue-500 to-red-500">
        <div
            class="bg-white p-8 rounded-lg shadow-2xl transform hover:scale-105 transition-all duration-300 max-w-md w-full">
            <h2 class="text-3xl font-bold text-center text-blue-600 mb-6 animate-pulse">Recuperar Contraseña</h2>
            <form @submit.prevent="handleSubmit" class="space-y-6">
                <div class="space-y-2">
                    <label for="email" class="text-sm font-medium text-gray-700">Correo Electrónico</label>
                    <input id="email" type="email" v-model="email" required @input="validateEmail"
                        class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 transition-all duration-300"
                        :class="[emailError ? 'border-red-500 focus:ring-red-500' : 'border-gray-300 focus:ring-blue-500']">
                    <p v-if="emailError" class="text-red-500 text-xs mt-1 animate-pulse">{{ emailError }}</p>
                </div>
                <button type="submit" :disabled="!isFormValid"
                    class="w-full py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 transform hover:scale-105 transition-all duration-300"
                    :class="[isFormValid ? 'bg-red-600 text-white hover:bg-red-700 focus:ring-red-500' : 'bg-gray-300 text-gray-500 cursor-not-allowed']">
                    Enviar Instrucciones
                </button>
            </form>
        </div>
    </div>
</template>

<script setup>
const router = useRouter()
const email = ref('')
const emailError = ref('')

const validateEmail = () => {
    if (email.value.length <= 2) {
        emailError.value = 'El correo debe tener más de 2 caracteres'
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)) {
        emailError.value = 'Ingrese un correo electrónico válido'
    } else {
        emailError.value = ''
    }
}

const isFormValid = computed(() => {
    return email.value.length > 2 &&
        /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value) &&
        !emailError.value
})

const handleSubmit = () => {
    if (isFormValid.value) {
        console.log('Formulario enviado:', { email: email.value })
        router.push('/')
    }
}

definePageMeta({
    layout: 'blanc'
})
</script>