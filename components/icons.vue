<script setup>
import { ArrowLeftIcon, ChevronLeftIcon, ChevronRightIcon, ArrowDownTrayIcon, ShareIcon } from '@heroicons/vue/20/solid';
import { UserIcon, UserPlusIcon, EnvelopeIcon, CheckCircleIcon, XCircleIcon, EyeIcon, EllipsisVerticalIcon, ArrowRightEndOnRectangleIcon, MagnifyingGlassIcon, ArrowPathIcon, CheckIcon, PlusIcon, AdjustmentsHorizontalIcon, ExclamationTriangleIcon, BellIcon, InformationCircleIcon, Bars3Icon, CalendarIcon, QrCodeIcon, HomeIcon, XMarkIcon, TicketIcon, UserGroupIcon, Cog6ToothIcon, MapPinIcon, ArrowRightStartOnRectangleIcon, PencilIcon, HomeModernIcon, ClockIcon, PhoneIcon, TrashIcon } from '@heroicons/vue/24/outline';
const props = defineProps({
    name: {
        type: String,
        required: true
    }
});
const iconMap = {
    'informative': InformationCircleIcon,
    'bell': BellIcon,
    'home': HomeIcon,
    'calendar': CalendarIcon,
    'ticket': TicketIcon,
    'servicio': TicketIcon,
    'recinto': HomeModernIcon,
    'userGroup': UserGroupIcon,
    'mapPin': MapPinIcon,
    'qrCode': QrCodeIcon,
    'cog6Tooth': Cog6ToothIcon,
    'arrowRightStartOnRectangle': ArrowRightStartOnRectangleIcon,
    'arrowRightEndOnRectangle': ArrowRightEndOnRectangleIcon,
    'Bars3': Bars3Icon,
    'XMark': XMarkIcon,
    'pencil': PencilIcon,
    'chevronLeft': ChevronLeftIcon,
    'chevronRight': ChevronRightIcon,
    'arrowDownTray': ArrowDownTrayIcon,
    'share': ShareIcon,
    'homeModern': HomeModernIcon,
    'clock': ClockIcon,
    'plus': PlusIcon,
    'exclamationTriangle': ExclamationTriangleIcon,
    'check': CheckIcon,
    'phone': PhoneIcon,
    'trash': TrashIcon,
    'arrowPath': ArrowPathIcon,
    'ajustes': AdjustmentsHorizontalIcon,
    'search': MagnifyingGlassIcon,
    'arrowLeft': ArrowLeftIcon,
    'ellipsisVertical': EllipsisVerticalIcon,
    'eye': EyeIcon,
    'xCircle': XCircleIcon,
    'checkCircle': CheckCircleIcon,
    'userPlus': UserPlusIcon,
    'envelope': EnvelopeIcon,
    'user': UserIcon
};
</script>

<template>
    <component :is="iconMap[name]" />
</template>
