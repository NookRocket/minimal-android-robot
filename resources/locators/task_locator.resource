*** Variables ***
${task_page.inp_task_name}            xpath=//android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/userToDoEditText"]
${task_page.btn_apply}                xpath=//android.widget.ImageView[@resource-id="com.avjindersinghsekhon.minimaltodo:id/makeToDoFloatingActionButton"]
${task_page.btn_switch_remind}        xpath=//android.widget.Switch[@resource-id="com.avjindersinghsekhon.minimaltodo:id/toDoHasDateSwitchCompat"]
${task_page.btn_set_remind_date}      xpath=//android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoDateEditText"]
${task_page.btn_pick_year}            xpath=//android.widget.Button[@resource-id="com.avjindersinghsekhon.minimaltodo:id/date_picker_year"]
${task_page.lbl_calendar_date}        xpath=//android.view.View[contains(@content-desc,"{{date}}")]
${task_page.frm_list}                 xpath=//android.widget.ListView      
${task_page.lbl_calendar_year}        xpath=//android.widget.TextView[@content-desc="{{year}}"]
${task_page.btn_apply_remind_date}    xpath=//android.widget.Button[@resource-id="com.avjindersinghsekhon.minimaltodo:id/ok"]
${task_page.btn_set_remind_time}      xpath=//android.widget.EditText[@resource-id="com.avjindersinghsekhon.minimaltodo:id/newTodoTimeEditText"]
