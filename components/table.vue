<template>
    <div v-if="columns.length && data.length" class="overflow-x-auto">
        <table class="w-full bg-white">
            <thead>
                <tr class="text-gray-800 border-b border-gray-300 uppercase text-sm leading-normal">
                    <th v-for="(column, index) in columns" :key="index" class="py-3 px-6 text-left">
                        {{ column.header }}
                    </th>
                    <th v-if="button" class="py-3 px-6 text-left">Acciones</th>
                </tr>
            </thead>
            <tbody class="text-gray-600 text-sm font-light">
                <tr v-for="(row, rowIndex) in data" :key="rowIndex" class="hover:bg-gray-100">
                    <td v-for="(column, colIndex) in columns" :key="colIndex"
                        class="py-3 px-6 text-left whitespace-nowrap">
                        {{ row[column.key] }}
                    </td>
                    <td v-if="button" class="py-3 px-6 text-left">
                        <button @click="handleButtonClick(row)"
                            class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-1 px-3 rounded transform transition-all duration-200 hover:scale-105">
                            {{ textButton }}
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div v-else>No hay datos para mostrar</div>
</template>

<script setup>
defineProps({
    columns: { type: Array, default: () => [] },
    data: { type: Array, default: () => [] },
    button: { type: Boolean, default: false },
    textButton: { type: String, default: 'Ver' }
});
const emit = defineEmits(['button-click']);
// Método para manejar el clic del botón
function handleButtonClick(row) {
    emit('button-click', row);
}
</script>
