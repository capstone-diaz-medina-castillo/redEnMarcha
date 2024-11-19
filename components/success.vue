<template>
    <Popup width-class="w-2/3 pl-6 pr-6 pb-6" @close="handleClose">
        <div class="bg-green-100 border-l-8 border-green-600 rounded-xl w-full p-5 flex justify-start items-center space-x-5">
            <div class="bg-green-600 p-3 aspect-square rounded-xl m-2 w-14 h-14 flex justify-center items-center ">
                <Icons name="checkCircle" class="text-white w-10 h-10"></Icons>
            </div>
            <div class="flex flex-col h-14 space-y-1 overflow-hidden justify-start items-start">
                <h1 class="text-green-800 font-bold text-2xl">{{ props.title }}</h1>
                <h2 class="text-gray-600 ">{{ props.subtitle }}</h2>
            </div>
        </div>
    </Popup>
</template>
<script setup>
const props = defineProps({
    title: {
        type: String,
        required: true,
        default: '¡Éxito!'
    },
    subtitle: {
        type: String,
        required: true,
        default: 'Operación exitosa'
    }
});

const handleClose = () => {
    console.log('close')
}
</script>