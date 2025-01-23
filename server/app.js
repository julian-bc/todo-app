import express from 'express';
import { 
    getTodo,
    shareTodo,
    deleteTodo,
    getTodosByID,
    createTodo,
    toggleCompleted,
    getUserByEmail,
    getUserByID,
    getSharedTodoByID,
} from './database.js'

const app = express();
app.use(express.json());

app.listen(8080, () => {
    console.log('Server listening on port 8080');
})
