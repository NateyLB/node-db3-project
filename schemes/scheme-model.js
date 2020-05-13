const db = require("../data/db-config.js");

module.exports={
    find,
     findById,
     findSteps,
     add,
     update,
     remove,
     addStep
};
//get all schemes, resolves to an array of all schemes
function find(){
    return db("schemes")
}
//get shceme by shcema id, resolves to specified scheme
function findById(id){
    return db("schemes").where({id}).first()
}
//find steps by schema id, resolves to all steps for specified scheme
function findSteps(id){
    return db("schemes")
    .join("steps", "schemes.id", "=", "steps.scheme_id")
    .select("steps.id", "schemes.scheme_name","steps.step_number", "steps.instructions")
    .where("scheme_id", id)
    .orderBy("step_number")
}
//added a new scheme to the scheme table, resolves to the added scheme
function add(scheme){
    return db("schemes")
    .insert(scheme, "id")
    .then(ids=>{
        return findById(ids[0]);
    })
}
//updates a specified scheme, resolves to the updated scheme
function update(changes, id){
    return db("schemes").where({id}).update(changes)
}
//deletes a specified scheme
function remove(id){
    return db("schemes").where({id}).del()
}
//adds a step, resolves to the added step
function addStep(step, scheme_id){
    return db("steps",)
    .insert(step, "id")
    .then(ids=>{
        return findSteps(scheme_id).where("steps.id", ids[0])
    })
}