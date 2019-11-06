const db = require('../data/db.config');

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
}

/* 
Calling find returns a promise that resolves to an array of all schemes in the database.
No steps are included.
*/
function find(){
  return db('schemes');
}

/* 
Expects a scheme id as its only parameter.
Resolve to a single scheme object.
On an invalid id, resolves to null.
*/
function findById(id){
  return db('schemes')
    .where({ id })
    .first()
}

/* 
Expects a scheme id.
Resolves to an array of all correctly ordered step for the given scheme: [ { id: 17, scheme_name: 'Find the Holy Grail', step_number: 1, instructions: 'quest'}, { id: 18, scheme_name: 'Find the Holy Grail', step_number: 2, instructions: '...and quest'}, etc. ].
This array should include the scheme_name not the scheme_id.
*/
function findSteps(id){
  return db('')
}

/* 
Expects a scheme object.
Inserts scheme into the database.
Resolves to the newly inserted scheme, including id.
*/
function add(){
  
}

/* STRETCH
This method expects a step object and a scheme id. It inserts the new step into the database, correctly linking it to the intended scheme.
*/
function addStep(){
  
}

/* 
Expects a changes object and an id.
Updates the scheme with the given id.
Resolves to the newly updated scheme object.
*/
function update(){
  
}

/* 
Removes the scheme object with the provided id.
Resolves to the removed scheme
Resolves to null on an invalid id.
(Hint: Only worry about removing the scheme. The database is configured to automatically remove all associated steps.)
*/
function remove(){
  
}