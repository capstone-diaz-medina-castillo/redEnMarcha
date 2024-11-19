<template>
    <div class="p-6 bg-gray-100 min-h-screen rounded-lg">
        <header class="mb-6">
            <h1 class="text-xl font-bold">Paso 1 de 3</h1>
        </header>

        <div class="space-y-8">
            <!-- Sección Menor de edad -->
            <section>
                <h3 class="text-lg font-semibold text-gray-800">Menor de edad</h3>
                <div class="grid grid-cols-2 gap-4 bg-white p-4 rounded-md shadow">
                    <div>
                        <label for="children-rut" class="block font-medium text-gray-700">RUT</label>
                        <input id="children-rut" type="text" v-model="children.rut" placeholder="RUT"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="children-name" class="block font-medium text-gray-700">Nombre</label>
                        <input id="children-name" type="text" v-model="children.name" placeholder="Nombre"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="children-last-name" class="block font-medium text-gray-700">Apellido</label>
                        <input id="children-last-name" type="text" v-model="children.lastName" placeholder="Apellido"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="children-birthdate" class="block font-medium text-gray-700">Fecha de
                            nacimiento</label>
                        <input id="children-birthdate" type="date" v-model="children.birthDate"
                            placeholder="Fecha de nacimiento" class="input-field" />
                    </div>
                    <div>
                        <label for="children-gender" class="block font-medium text-gray-700">Género</label>
                        <select id="children-gender" v-model="children.gender" class="input-field">
                            <option disabled value="">Seleccionar género</option>
                            <option value="male">Masculino</option>
                            <option value="female">Femenino</option>
                            <option value="other">Otro</option>
                        </select>
                    </div>
                    <div>
                        <label for="children-schooling" class="block font-medium text-gray-700">Escolaridad</label>
                        <input id="children-schooling" type="text" v-model="children.schooling"
                            placeholder="Escolaridad" class="input-field" />
                    </div>
                </div>
            </section>


            <section>
                <h3 class="text-lg font-semibold text-gray-800">Persona privada de libertad</h3>
                <div class="grid grid-cols-2 gap-4 bg-white p-4 rounded-md shadow">
                    <div>
                        <label for="privated-rut" class="block font-medium text-gray-700">RUT</label>
                        <input id="privated-rut" type="text" v-model="privatedGuy.rut" placeholder="RUT"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="privated-name" class="block font-medium text-gray-700">Nombre</label>
                        <input id="privated-name" type="text" v-model="privatedGuy.name" placeholder="Nombre"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="privated-lastname" class="block font-medium text-gray-700">Apellido</label>
                        <input id="privated-lastname" type="text" v-model="privatedGuy.lastName" placeholder="Apellido"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="privated-birthdate" class="block font-medium text-gray-700">Fecha de
                            nacimiento</label>
                        <input id="privated-birthdate" type="date" v-model="privatedGuy.birthDate"
                            placeholder="Fecha de nacimiento" class="input-field" />
                    </div>
                    <div>
                        <label for="privated-gender" class="block font-medium text-gray-700">Género</label>
                        <select id="privated-gender" v-model="privatedGuy.gender" class="input-field">
                            <option disabled value="">Seleccionar género</option>
                            <option value="male">Masculino</option>
                            <option value="female">Femenino</option>
                            <option value="other">Otro</option>
                        </select>
                    </div>
                    <div>
                        <label for="privated-date" class="block font-medium text-gray-700">Fecha de privación de
                            libertad</label>
                        <input id="privated-date" type="date" v-model="privatedGuy.privatedDate"
                            placeholder="Fecha de privación de libertad" class="input-field" />
                    </div>
                    <div>
                        <label for="privated-jail" class="block font-medium text-gray-700">Cárcel</label>
                        <input id="privated-jail" type="text" v-model="privatedGuy.jail" placeholder="Cárcel"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="privated-nna-relationship" class="block font-medium text-gray-700">Relación con
                            NNA</label>
                        <input id="privated-nna-relationship" type="text" v-model="privatedGuy.nnaRelationship"
                            placeholder="Relación con NNA" class="input-field" />
                    </div>
                </div>
            </section>


            <section>
                <h3 class="text-lg font-semibold text-gray-800">Persona cuidadora</h3>
                <div class="grid grid-cols-2 gap-4 bg-white p-4 rounded-md shadow">
                    <div>
                        <label for="carer-rut" class="block font-medium text-gray-700">RUT</label>
                        <input id="carer-rut" type="text" v-model="carer.rut" placeholder="RUT" class="input-field" />
                    </div>
                    <div>
                        <label for="carer-name" class="block font-medium text-gray-700">Nombre</label>
                        <input id="carer-name" type="text" v-model="carer.name" placeholder="Nombre"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="carer-lastname" class="block font-medium text-gray-700">Apellido</label>
                        <input id="carer-lastname" type="text" v-model="carer.lastName" placeholder="Apellido"
                            class="input-field" />
                    </div>
                    <div>
                        <label for="carer-birthdate" class="block font-medium text-gray-700">Fecha de nacimiento</label>
                        <input id="carer-birthdate" type="date" v-model="carer.birthDate"
                            placeholder="Fecha de nacimiento" class="input-field" />
                    </div>
                    <div>
                        <label for="carer-gender" class="block font-medium text-gray-700">Género</label>
                        <select id="carer-gender" v-model="carer.gender" class="input-field">
                            <option disabled value="">Seleccionar género</option>
                            <option value="male">Masculino</option>
                            <option value="female">Femenino</option>
                            <option value="other">Otro</option>
                        </select>
                    </div>
                </div>
            </section>

        </div>

        <footer class="mt-8 flex justify-end">
            <button @click="nextStep" :disabled="!isFormComplete" class="py-2 px-4 rounded-md text-white font-bold"
                :class="isFormComplete ? 'bg-blue-500 hover:bg-blue-700' : 'bg-gray-400 cursor-not-allowed'">
                Siguiente
            </button>
        </footer>
    </div>
</template>

<script setup>
import { computed, ref } from "vue";

const emit = defineEmits(['next-step']);

const children = ref({
    rut: null,
    name: null,
    lastName: null,
    birthDate: null,
    gender: null,
    schooling: null,
});

const privatedGuy = ref({
    rut: null,
    name: null,
    lastName: null,
    birthDate: null,
    gender: null,
    privatedDate: null,
    jail: null,
    nnaRelationship: null,
});

const carer = ref({
    rut: null,
    name: null,
    lastName: null,
    birthDate: null,
    gender: null,
});

// Verifica si todos los campos están completos
const isFormComplete = computed(() => {
    const isComplete = (obj) => Object.values(obj).every(value => value !== null && value !== '');
    return isComplete(children.value) && isComplete(privatedGuy.value) && isComplete(carer.value);
});

const nextStep = () => {
    emit('next-step', { children: children.value, privatedGuy: privatedGuy.value, carer: carer.value });
};
</script>

<style>
.input-field {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #d1d5db;
    border-radius: 0.375rem;
    background: #f9fafb;
    outline: none;
    transition: border-color 0.2s;
}

.input-field:focus {
    border-color: #3b82f6;
}
</style>
