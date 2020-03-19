const db = require('../data/db-config');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where({ id })
        .first();
}

function findSteps(id) {
    return db("steps")
      .select('st.id', 's.scheme_name', 'st.step_number', 'st.instructions')
        .from('schemes as s')
        .join ('steps as st', 'st.scheme_id', '=', 's.id')
        .where({ scheme_id: id })
        .orderBy('st.step_number');
}

function add(scheme) {
    return db('schemes').insert(scheme);
}

function update(changes, id) {
    return db('schemes')
        .where({ id })
        .update(changes)
        .then(() => {
            return findById(id)
        })
}

function remove(id) {
    return db('schemes')
        .where({ id: id})
        .delete()
}