// application.js

document.addEventListener("DOMContentLoaded", function () {
    // ✅ Flash message auto-hide
    const flashMessages = document.querySelectorAll(".alert");
    flashMessages.forEach((flash) => {
      setTimeout(() => {
        flash.classList.add("fade");
        flash.classList.add("show");
        flash.style.transition = "opacity 0.5s ease-out";
        flash.style.opacity = "0";
        setTimeout(() => flash.remove(), 500);
      }, 3000);
    });
  
    // ✅ Dropdown colorizer for priority/status
    const colorizeSelect = (select, colorMap) => {
      const applyColor = () => {
        const value = select.value;
        const classes = colorMap[value] || '';
        select.className = `form-select ${classes}`;
      };
      select.addEventListener("change", applyColor);
      applyColor(); // Run initially
    };
  
    // 🎨 Priority and status color mappings using Bootstrap classes
    const priorityMap = {
      High: "bg-danger text-white",
      Medium: "bg-warning text-dark",
      Low: "bg-success text-white",
    };
  
    const statusMap = {
      "Not Started": "bg-secondary text-white",
      "In Progress": "bg-warning text-dark",
      "On Hold": "bg-secondary text-white",
      "Completed": "bg-success text-white",
    };
  
    // 🕵️ Find select dropdowns and apply color styling
    const prioritySelect = document.querySelector(".priority-select");
    const statusSelect = document.querySelector(".status-select");
  
    if (prioritySelect) colorizeSelect(prioritySelect, priorityMap);
    if (statusSelect) colorizeSelect(statusSelect, statusMap);
  });
  console.log("✅ JavaScript is working!");
