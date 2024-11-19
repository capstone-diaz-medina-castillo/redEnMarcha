<template>
    <div class="fixed inset-0 bg-black bg-opacity-50 flex justify-center items-center z-50 animate-fadeIn"
        :class="`alert-${type}`">
        <div id="content"
            :class="`bg-white p-1 rounded-lg mx-2 overflow-y-auto max-h-screen text-left animate-appearFromCenter ${widthClass} ${heightClass}`">
            <div class="flex justify-end right-5 ">
                <button @click="closePopup"
                    class=" z-50 items-center justify-center text-black  p-1 m-2 transform transition-all duration-500">
                    <Icons name="XMark" class="h-6 w-6" />
                </button>
            </div>
            <slot></slot>
        </div>
    </div>
</template>

<script setup>
const emit = defineEmits(['close']);
const popup = ref(0);
const closePopup = () => {
    popup.value = 0;
    emit('close', popup.value)
};
const props = defineProps({
    type: { type: String, default: 'error' }, 
    widthClass: { type: String, default: 'w-auto' },
    heightClass: { type: String, default: 'h-auto' }
});
</script>