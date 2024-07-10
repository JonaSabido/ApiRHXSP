const { ExtraTimeQueryFilter } = require('../../../helpers/QueryFilters');
const { EmployeeModel } = require('../../employee/infrastructure/EmployeeModel');
const IExtraTimeRepository = require('../domain/IExtraTimeRepository');
const { ExtraTimeModel } = require('./ExtraTimeModel')
const fs = require('fs');
const path = require('path');

const relations = [
    {
        model: EmployeeModel,
        attributes: ['id', 'name', 'sure_name', 'last_name'],
        as: 'employee'
    },
]

class ExtraTimeRepository extends IExtraTimeRepository {
    constructor() {
        super()
    }

    async getAll(filters) {
        try {
            return await ExtraTimeModel.findAll({
                include: relations,
                order: [['id', 'DESC']],
                where: ExtraTimeQueryFilter(filters)
            });
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async getById(id) {
        try {
            const entity = await ExtraTimeModel.findByPk(id, { include: relations, })
            if (!entity) {
                throw new Error('Entity not found')
            }
            return entity
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async create(data) {
        try {
            return await ExtraTimeModel.create(data)
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async update(id, data) {
        try {
            return await ExtraTimeModel.update(data, {
                where: {
                    id: id
                }
            })
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async delete(id) {
        try {
            return await ExtraTimeModel.destroy(
                {
                    where: {
                        id: id
                    }
                })
        }
        catch (err) {
            throw new Error(err.message)
        }
    }

    async saveFiles(id, files) {
        const path = 'uploads/extra-times/'
        if (files.evidence) {
            let file = files.evidence
            file.mv(path + id + '/evidence.pdf')
        }
    }

    async destroyFilesById(id) {
        const directory = path.join('uploads/extra-times/', id.toString());

        try {
            // Verificar si el directorio existe
            if (fs.existsSync(directory)) {
                // Leer todos los archivos en el directorio
                const files = fs.readdirSync(directory);

                // Eliminar cada archivo
                files.forEach(file => {
                    const filePath = path.join(directory, file);
                    fs.unlinkSync(filePath);
                    console.log(`Eliminando archivo ${filePath}`);
                });

                // Eliminar el directorio vacío
                fs.rmdirSync(directory);
                console.log(`Directorio ${directory} eliminado`);
            } else {
                console.log(`El directorio ${directory} no existe`);
            }
        } catch (err) {
            console.error(`Error al eliminar archivos del directorio ${directory}:`, err);
            throw new Error(`Error al eliminar archivos del directorio ${directory}: ${err.message}`);
        }
    }
}

module.exports = ExtraTimeRepository;