<template>
    <div class="w-full h-full pl-4 pr-4 rounded-2xl overflow-hidden shadow-xl shadow-gray-300 border border-gray-300 ">
        <header class="flex items-center justify-center  px-6 py-4 ">
            <div class="flex w-full items-center">
                <div class="relative w-full flex items-center rounded-md bg-white shadow-sm md:items-stretch">
                    <button @click="prevMonth" type="button"
                        class="flex h-9 w-1/3 items-center justify-center transform transition-all duration-200 hover:text-indigo-600 hover:scale-110 ">
                        <Icons name="chevronLeft" class="h-5 w-5" aria-hidden="true" />
                    </button>
                    <button @click="goToToday" type="button"
                        class=" px-3.5 w-1/3 text-sm font-semibold text-gray-900 hover:bg-indigo-600 rounded-md hover:text-white focus:relative h-9 transform transition-all duration-500">
                        {{ getCurrentMonth(currentMonth) }}
                    </button>
                    <button @click="nextMonth" type="button"
                        class="flex h-9 w-1/3 items-center justify-center transform transition-all duration-200 hover:text-indigo-600 hover:scale-110">
                        <Icons name="chevronRight" class="h-5 w-5" aria-hidden="true" />
                    </button>
                </div>
            </div>
        </header>
        <div class="rounded-3xl">
            <div
                class="grid grid-cols-7 gap-px  rounded-3xl   bg-white text-center text-xs font-semibold leading-6 text-gray-700">
                <div class="bg-white   py-2 rounded-tl-xl">L</div>
                <div class="bg-white py-2 ">Ma</div>
                <div class="bg-white py-2 ">Mi</div>
                <div class="bg-white py-2 ">J</div>
                <div class="bg-white py-2 ">V</div>
                <div class="bg-white py-2 ">S</div>
                <div class="bg-white py-2 ">D</div>
            </div>
            <div class="flex bg-white text-xs leading-6 text-gray-700 h-96 overflow-hidden rounded-2xl">
                <div class="isolate grid w-full h-full grid-cols-7 grid-rows-6 gap-px">
                    <button v-if="props.interactive == true" @click="showDay(day)" v-for="day in calendarDays"
                        :key="day.date" type="button"
                        :class="[day.isCurrentMonth ? ' bg-gray-100 ' : 'bg-white ', (day.isSelected || day.isToday) && 'font-semibold', day.isSelected && 'text-white', !day.isSelected && day.isToday && 'bg-indigo-500 text-white', !day.isSelected && day.isCurrentMonth && !day.isToday && 'text-gray-900', !day.isSelected && !day.isCurrentMonth && !day.isToday && 'text-gray-500', 'flex flex-col justify-center items-center align-middle px-3 py-3 focus:z-10 rounded-xl m-1 w-14 h-14 aspect-square hover:bg-indigo-200']">
                        <time :datetime="day.date"
                            :class="[day.isSelected && 'flex h-6 w-6 items-center justify-center rounded-full', day.isSelected && day.isToday && 'bg-indigo-600', day.isSelected && !day.isToday && 'bg-gray-900', 'font-medium text-xl']">
                            {{ day.date.split('-').pop().replace(/^0/, '') }}
                        </time>
                        <div class="w-full flex justify-center items-center">
                            <span v-if="day.events.length > 0"
                                class="mt-auto flex flex-wrap-reverse overflow-hidden mx-0.5 mb-1 h-6 w-6 rounded-full bg-indigo-600"></span>
                        </div>
                    </button>
                    <button v-else v-for="day in calendarDays" type="button"
                        :class="[day.isCurrentMonth ? 'bg-gray-100 ' : ' bg-white', (day.isSelected || day.isToday) && 'font-semibold', day.isSelected && 'text-white', !day.isSelected && day.isToday && 'bg-indigo-500 text-white', !day.isSelected && day.isCurrentMonth && !day.isToday && 'text-gray-900 ', !day.isSelected && !day.isCurrentMonth && !day.isToday && 'text-gray-500', 'flex flex-col justify-center items-center align-middle px-3 py-3 focus:z-10 rounded-xl m-1 w-14 h-14 aspect-square ']">
                        <time :datetime="day.date"
                            :class="[day.isSelected && 'flex h-6 w-6 items-center justify-center rounded-full', day.isSelected && day.isToday && 'bg-indigo-600', day.isSelected && !day.isToday && 'bg-gray-900', 'font-medium text-xl']">
                            {{ day.date.split('-').pop().replace(/^0/, '') }}
                        </time>
                        <div class="w-full flex justify-center items-center">
                            <span v-if="day.events.length > 0"
                                class="  flex-wrap-reverse overflow-hidden mx-0.5 h-2 w-2 rounded-full bg-indigo-600"></span>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    </div>

</template>
<script setup>
import moment from 'moment';
const currentMonth = ref(moment().startOf('month'));
const props = defineProps({
    itemList: {
        Array,
        default: [{ 'startAt': '' }],
    },
    interactive: {
        type: Boolean,
        default: false
    },
});
const calendarDays = computed(() => {
    const startOfMonth = currentMonth.value.clone().startOf('month');
    const endOfMonth = currentMonth.value.clone().endOf('month');
    const startDate = startOfMonth.clone().startOf('week');
    const endDate = endOfMonth.clone().endOf('week');
    const days = [];
    let day = startDate.clone();
    while (day.isBefore(endDate, 'day')) {
        days.push({
            date: day.format('YYYY-MM-DD'),
            day: day.date(),
            isCurrentMonth: day.isSame(currentMonth.value, 'month'),
            isToday: day.isSame(moment(), 'day'),
            events: props.itemList.filter(event => day.isSame(moment(event.startAt), 'day'))
        });
        day.add(1, 'day');
    }
    return days;
});
const getCurrentMonth = (month) => { return moment(month).format('MMMM , YYYY'); }
const prevMonth = () => { currentMonth.value.subtract(1, 'month'); };
const nextMonth = () => { currentMonth.value.add(1, 'month'); };
const goToToday = () => { currentMonth.value = moment().startOf('month'); };

const emit = defineEmits(['showDay']);

const showDay = (day) => { emit('showDay', day) }
onMounted(() => { });
</script>