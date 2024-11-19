<template>
  <div
    class="w-full  h-5/6 border border-gray-300 flex flex-col align-top justify-start items-start mx-auto bg-white rounded-xl shadow-xl shadow-gray-300 p-4 overflow-y-auto">
    <header>
      Últimos casos actualizados
    </header>
    <div>
      <Table :data="formattedCasos" :columns="columns" :button="true" text-button="Ver caso" @button-click="goToCase">
      </Table>
    </div>
  </div>
</template>

<script setup>
const router = useRouter()
const columns = ref([
  {
    key: 'nna',
    header: 'NNA',
  },
  {
    key: 'cuidador',
    header: 'Cuidador',
  },
  {
    key: 'assignedProfessionals',
    header: 'Profesionales Asignados',
  }
]);

// Computed para formatear los datos de los casos
const formattedCasos = computed(() => {
  return casos.value.map(caso => {
    // Encontrar el NNA (usuario con userType 'NNA')
    const nna = caso.userObject.find(user => user.userType === 'NNA');
    // Encontrar el Cuidador (usuario con userType 'cuidador')
    const cuidador = caso.userObject.find(user => user.userType === 'cuidador');

    // Extraer nombres de los profesionales asignados
    const professionalNames = caso.assignedProfessionals
      .map(professional => professional.name)
      .join(', ');

    return {
      ...caso,
      nna: nna ? `${nna.name} ${nna.second_name}` : 'N/A',
      cuidador: cuidador ? `${cuidador.name} ${cuidador.second_name}` : 'N/A',
      assignedProfessionals: professionalNames
    };
  });
});

const goToCase = (row) => {
  console.log(row);
  router.push(`/casos/caso/${row.id}`);

}
</script>