<template>
    <div
        class="w-full  h-5/6 border border-gray-300 flex flex-col align-top justify-start items-start mx-auto bg-white rounded-xl shadow-xl shadow-gray-300 p-4 overflow-hidden">
        <header class="flex justify-between items-center w-full mb-4">
            <div class="text-xl">
                <h1>Miembros de la organización</h1>
            </div>
            <div>
                <NuxtLink :to="'/profesionales/agregar-profesional'">
                    <button
                        class="rounded-full flex justify-center items-center p-1 text-white bg-indigo-600 transform transition-all duration-500 hover:scale-105">
                        <Icons name="plus" class="w-5 h-5"></Icons>
                    </button>
                </NuxtLink>
            </div>
        </header>
        <div class="w-full">
            <ul class="space-y-4 overflow-y-auto overflow-x-hidden" v-if="users.length >= 1 && loadingProfiles == false">
                <li v-for="profile in users" :key="profile.id" class="w-full">
                    <button @click="ViewGrantedUser(profile)"
                        class=" w-full flex border border-gray-200 items-center gap-4 bg-white rounded-lg shadow-lg p-4 transition-all duration-200 hover:shadow-xl hover:scale-105">
                        <img :src="profile.avatar || 'https://via.placeholder.com/150'" alt="Avatar"
                            class="rounded-full w-24 h-24 object-cover border-2 border-gray-300 overflow-hidden"
                            style="object-fit: cover;" />
                        <div class="flex flex-col justify-start">
                            <h2 class="text-xl font-medium text-gray-800">
                                {{ profile.name }} {{ profile.second_name }}
                            </h2>
                            <p class="text-gray-500">{{ profile.profesion || 'Sin profesión' }}</p>
                        </div>
                        <div class="ml-auto">
                            <Icons name="ellipsisVertical" class="ml-auto w-10 h-10"></Icons>
                        </div>
                    </button>
                </li>
            </ul>
        </div>
    </div>
</template>

<script setup>
const popup = ref(0)
const selectedUser = ref(null)
const loadingProfiles = ref(false)
const ViewGrantedUser = (object) => {
    popup.value = 2
    selectedUser.value = object
}
</script>