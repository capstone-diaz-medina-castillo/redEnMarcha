<template>
    <div>
        <header class="mb-6">
            <h1 class="text-xl font-bold">Paso 2 de 3</h1>
            <h2>Selecciona a los profesionales asignados en el caso</h2>
        </header>
        <div class="flex justify-center w-full m-10">
            <div v-for="(profesional, index) in assignedProfessionals" :key="index"
                class="w-full m-10 max-w-sm rounded-lg border overflow-hidden transform transition duration-300 hover:scale-105 shadow-xl"
                :class="[
                    profesional && profesional.name
                        ? 'bg-white border-l-blue-500 border-t-blue-500 border-b-red-500 border-r-red-500 shadow-gray-400'
                        : 'bg-gray-200 border-gray-400 shadow-gray-300'
                ]">
                <div :class="[
                    'relative h-32 transition duration-300',
                    profesional && profesional.name ? 'bg-gradient-to-r from-blue-500 to-red-500 animate-gradient' : 'bg-gray-300'
                ]">
                    <div class="absolute -bottom-12 left-1/2 transform -translate-x-1/2">
                        <div v-if="profesional && profesional.avatar" class="relative group">
                            <img :src="profesional.avatar" :alt="profesional.name"
                                class="w-24 h-24 rounded-full border-4 border-white object-cover transition-transform duration-300 group-hover:rotate-6" />
                        </div>
                        <div v-else
                            class="w-24 h-24 rounded-full border-4 border-white bg-gray-200 flex items-center justify-center transition-transform duration-300 hover:rotate-6">
                            <Icons name="plus" size="40" class="text-gray-400" />
                        </div>
                    </div>
                </div>
                <!-- User Information -->
                <div class="pt-16 pb-8 px-6">
                    <div class="text-center">
                        <h2
                            :class="['text-xl font-bold transform transition duration-300', profesional && profesional.name ? 'text-gray-800 hover:scale-110' : 'text-gray-500']">
                            {{ profesional && profesional.name ? profesional.name : 'Haga clic para seleccionar profesional' }}
                        </h2>
                    </div>
                    <!-- Dropdown -->
                    <div class="mt-4">
                        <select v-model="selectedUsers[index]" class="w-full border p-2"
                            @change="assignProfessional(index)">
                            <option value="" disabled>Selecciona un profesional</option>
                            <option v-for="user in availableUsers(index)" :key="user.id" :value="user">
                                {{ user.name }} {{ user.second_name }} - {{ user.profesion }}
                            </option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <footer class="flex justify-between items-center w-full">
            <div>
                <button @click="prevStep" class="bg-red-500 hover:bg-red-700 text-white py-2 px-4 rounded-md">
                    Anterior</button>
            </div>
            <div>
                <button class="bg-blue-500 hover:bg-blue-700 text-white py-2 px-4 rounded-md"
                    @click="nextStep">Siguiente</button>
            </div>
        </footer>
    </div>
</template>

<script setup>
import { ref } from 'vue';
import { users } from '@/composables/dummyData'; // Importamos los usuarios desde el composable

const emit = defineEmits(['next-step', 'prev-step']);

// Profesionales asignados al caso
const assignedProfessionals = ref([
    {},
    {}
]);

// Estado para el dropdown de cada profesional
const selectedUsers = ref(Array(assignedProfessionals.value.length).fill(null));

// Obtener usuarios disponibles (excluyendo los ya seleccionados)
const availableUsers = (index) => {
    const selectedIds = selectedUsers.value
        .filter((user) => user) // Excluir valores nulos
        .map((user) => user.id); // Obtener los IDs seleccionados
    return users.value.filter((user) => !selectedIds.includes(user.id) || selectedUsers.value[index]?.id === user.id);
};

// Manejar la asignación de un profesional
const assignProfessional = (index) => {
    const selectedUser = selectedUsers.value[index];
    if (selectedUser) {
        assignedProfessionals.value[index] = { ...selectedUser };
    }
};

// Navegación
const nextStep = () => {
    emit('next-step', assignedProfessionals.value);
};
const prevStep = () => {
    emit('prev-step');
};
</script>
