<template>
    <div class="mt-10 space-y-5">
        <header class="flex justify-between w-full items-center">
            <div class="flex flex-col space-y-3">
                <h1 class="flex justify-start text-xl font-medium">Miembros del equipo</h1>
                <h2>
                    aquí podrás ver a los miembros de tu equipo, agregarlos y editarles los permisos que poseen.
                </h2>
            </div>
            <button @click="goToNewUser" class="bg-blue-800 p-3 rounded-lg text-white  font-medium">Agregar
                miembro</button>
        </header>
        <div class="w-full">
            <Columns>
                <Card v-for="member in users" :name="`${member.name} ${member.second_name}`" :photo="member.avatar"
                    :profesion="member.profesion" :email="member.email" :role="member.role">
                </Card>
            </Columns>
        </div>
    </div>
</template>

<script setup>
const router = useRouter()
const goToNewUser = () => {
    router.push('/profesionales/agregar-profesional')
}
definePageMeta({ layout: 'main' })
</script>