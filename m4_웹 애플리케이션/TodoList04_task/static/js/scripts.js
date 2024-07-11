document.addEventListener("DOMContentLoaded", function () {
  fetch("/tasks")
    .then((response) => response.json())
    .then((tasks) => {
      const taskList = document.getElementById("task-list");
      tasks.forEach((task) => {
        const li = document.createElement("li");

        const taskContent = document.createElement("div");
        taskContent.innerHTML = `<strong>${task.title}</strong><br>
                                 ${task.contents}<br>
                                 등록일: ${task.input_date}<br>
                                 마감일: ${task.due_date}<br>`;
        li.appendChild(taskContent);

        const btnContainer = document.createElement("p");
        btnContainer.classList.add('a_btn');

        const deleteLink = document.createElement("a");
        deleteLink.href = `/delete/${task.id}`;
        deleteLink.textContent = "Delete";
        deleteLink.classList.add('a_btn_del');
        btnContainer.appendChild(deleteLink);

        const editLink = document.createElement("a");
        editLink.href = `/edit/${task.id}`;
        editLink.textContent = "Edit";
        editLink.classList.add('a_btn_edit');
        btnContainer.appendChild(editLink);

        li.appendChild(btnContainer);
        taskList.appendChild(li);
      });
    });
});
