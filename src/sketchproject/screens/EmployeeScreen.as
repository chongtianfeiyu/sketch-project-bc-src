package sketchproject.screens
{
	
	import sketchproject.objects.employee.Employee;
	import sketchproject.objects.employee.Incentive;
	import sketchproject.objects.employee.Resume;
	
	import starling.display.Sprite;
	
	public class EmployeeScreen extends GameScreen
	{
		private var resume:Resume;
		private var employee:Employee;
		private var incentive:Incentive;
		
		public function EmployeeScreen()
		{
			super(true, "icon_employee", "Employee","Number of employees, salaries, benefits","Decision impact employee morale, productivity, and turnover rate.");
			
			resume = new Resume();
			addChild(resume);
			
			employee = new Employee();
			addChild(employee);
			
			incentive = new Incentive();
			addChild(incentive);
			
			switchPage(resume);
			
		}
		
	}
	
	private function switchPage(page:Sprite):void
	{
		resume.visible = false;
		employee.visible = false;
		incentive.visible = false;
		
		page.visible = true;
	}
}