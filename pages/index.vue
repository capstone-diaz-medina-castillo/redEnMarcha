<template>
    <div class="max-w-screen-2xl">
        <header class="text-2xl font-medium mb-10">
            <h1>Bienvenido a Red En Marcha, <strong class="text-blue-800">{{ actualUser.name }} {{
                actualUser.second_name }}</strong></h1>
        </header>
        <div class="flex w-full justify-between">
            <section class="flex flex-col w-6/12 h-full pr-3">
                <HomeMiembrosDeEquipo></HomeMiembrosDeEquipo>
            </section>
            <section class="flex flex-col w-6/12 h-full space-y-5 pl-3">
                <div class="w-full">
                    <HomeCasos></HomeCasos>
                </div>
                <div class="bg-green-500">

                </div>
            </section>
        </div>
    </div>
</template>

<script setup>

definePageMeta({ layout: 'main', middleware: 'auth' })
</script>