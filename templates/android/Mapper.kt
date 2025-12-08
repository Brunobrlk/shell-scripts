package ${PKG}.data.mappers

import ${PKG}.data.local.database.entities.${CLASS}Entity
import ${PKG}.data.remote.dtos.${CLASS}Dto
import ${PKG}.domain.models.${CLASS}

// Dto to Domain
fun ${CLASS}Dto.asDomainModel(): ${CLASS} = ${CLASS}(
${PROPS_MAPPED}
)

fun List<${CLASS}Dto>.asDomainList(): List<${CLASS}> = map { it.asDomainModel() }

// Dto to Entity
fun ${CLASS}Dto.asEntityModel(): ${CLASS}Entity = ${CLASS}Entity(
${PROPS_MAPPED}
)

fun List<${CLASS}Dto>.asEntityList(): List<${CLASS}Entity> = map { it.asEntityModel() }

// Entity to Domain
fun ${CLASS}Entity.asDomainModel(): ${CLASS} = ${CLASS}(
${PROPS_MAPPED}
)

fun List<${CLASS}Entity>.asDomainList(): List<${CLASS}> = map { it.asDomainModel() }
