<template>
    <div>
        <header>
            <div>
                <h1>Historial</h1>
                <h2>Aquí podrás ver el historial de modificaciones del caso de {{ caso.userObject?.nna.name }} {{
                    caso.userObject?.nna.second_name }}</h2>
            </div>
        </header>
        <div>
            <Table :data="historyData" :columns="columns"></Table>
        </div>
    </div>
</template>

<script setup>

const caso = ref({
    id: '1',
    createdAt: '2024-10-18',
    updateAt: '2024-10-18',
    forms: [
        { id: 'form1', name: 'Formulario Inicial' }
    ],
    userObject: {
        nna: { id: 'nna1', name: 'Juan', second_name: 'Pérez', birthDate: '2015-05-12', gender: 'Masculino', userType: 'NNA', escolaridad: 'Primaria' },
        cuidador: { id: 'cuidador1', name: 'María', second_name: 'González', birthDate: '1985-07-20', gender: 'Femenino', userType: 'cuidador' },
        adulto_privado_libertad: { id: 'adulto1', name: 'Carlos', second_name: 'Pérez', birthDate: '1980-03-15', gender: 'Masculino', userType: 'adulto_privado_libertad', nnaRelationship: 'Padre', deprivationDate: '2023-08-12' }

    },
    assignedProfessionals: [
        { id: 'user1', name: 'Raul Medina', profesion: 'psicologo' },
        { id: 'user2', name: 'Jhonny Castillo', profesion: 'psiquiatra' }
    ]
})

const historyData = ref([
    {
        id: '1A',
        date: '2024-11-10',
        responsable: 'Jesús Díaz',
        action: 'Creación de caso',
        description: 'Se ha creado el caso de un niño de 5 años el cual sus padres se encuentran en el centro penitenciario de Santiago de Chile',
    },
    {
        id: '2A',
        date: '2024-11-11',
        responsable: 'Jesús Díaz',
        action: 'Asignación de profesional',
        description: 'Se ha asignado a la trabajadora social Raul Medina al caso',
    },
    {
        id: '3A',
        date: '2024-11-11',
        responsable: 'Jesús Díaz',
        action: 'Asignación de profesional',
        description: 'Se ha asignado al psicólogo Jhonny Castillo al caso',
    },
    {
        id: '4A',
        date: '2024-11-12',
        responsable: 'Jesús Díaz',
        action: 'Creación de formulario',
        description: 'Se ha creado el formulario inicial del caso',
    },
    {
        id: '5A',
        date: '2024-11-12',
        responsable: 'Johnny Castillo',
        action: 'Creación de formulario',
        description: 'Se ha respondido el formulario inicial del caso',
    }
])

const columns = ref([
    {
        key: 'id',
        header: 'ID',
    },
    {
        key: 'date',
        header: 'Fecha',
    },
    {
        key: 'responsable',
        header: 'Responsable',
    },
    {
        key: 'action',
        header: 'Acción',
    },
    {
        key: 'description',
        header: 'Descripción',
    }
])

definePageMeta({ layout: 'main' })
</script>