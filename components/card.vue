<!-- components/UserCard.vue -->
<template>
    <div
        class="w-full max-w-sm bg-white rounded-lg border border-l-blue-500 border-t-blue-500 border-b-red-500  border-r-red-500 overflow-hidden transform transition duration-300 hover:scale-105 shadow-xl shadow-gray-400">
        <div class="relative h-32 bg-gradient-to-r from-blue-500 to-red-500 animate-gradient">
            <div class="absolute -bottom-12 left-1/2 transform -translate-x-1/2">
                <div v-if="photo" class="relative group">
                    <img :src="photo" :alt="name"
                        class="w-24 h-24 rounded-full border-4 border-white object-cover transition-transform duration-300 group-hover:rotate-6" />
                    <div
                        class="absolute inset-0 bg-blue-500 opacity-0 group-hover:opacity-20 rounded-full transition-opacity duration-300">
                    </div>
                </div>
                <div v-else
                    class="w-24 h-24 rounded-full border-4 border-white bg-gray-200 flex items-center justify-center transition-transform duration-300 hover:rotate-6">
                    <Icon name="lucide:user" size="40" class="text-gray-400" />
                </div>
            </div>
        </div>

        <!-- User Information -->
        <div class="pt-16 pb-8 px-6">
            <div class="text-center">
                <h2 class="text-xl font-bold text-gray-800 transform transition duration-300 hover:scale-110">{{ name }}
                </h2>
            </div>
            <!-- Contact Details -->
            <div class="mt-6 space-y-4">
                <div class="flex items-center text-gray-700 transform transition duration-300 hover:-translate-x-2">
                    <Icons name="userGroup" class="w-5 h-5 mr-3 text-blue-500" />
                    <span class="text-sm">{{ profesion }}</span>
                </div>
                <div class="flex items-center text-gray-700 transform transition duration-300 hover:-translate-x-2">
                    <Icons name="user" class="w-5 h-5 mr-3 text-blue-500" />
                    <span class="text-sm">{{ role }}</span>
                </div>
                <div class="flex items-center text-gray-700 transform transition duration-300 hover:-translate-x-2">
                    <Icons name="envelope" class="w-5 h-5 mr-3 text-blue-500" />
                    <span class="text-sm">{{ email }}</span>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
defineProps({
    photo: {
        type: String,
        required: false
    },
    name: {
        type: String,
        required: true
    },
    role: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    phone: {
        type: String,
        required: true
    },
    profesion: {
        type: String,
        required: true
    }
})
</script>

<style>
@keyframes gradient {
    0% {
        background-position: 0% 50%;
    }

    50% {
        background-position: 100% 50%;
    }

    100% {
        background-position: 0% 50%;
    }
}

.animate-gradient {
    background-size: 200% 200%;
    animation: gradient 6s ease infinite;
}
</style>