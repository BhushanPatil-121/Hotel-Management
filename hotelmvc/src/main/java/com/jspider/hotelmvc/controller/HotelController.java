package com.jspider.hotelmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.jspider.hotelmvc.pojo.AdminPOJO;
import com.jspider.hotelmvc.pojo.GuestHistoryPOJO;
import com.jspider.hotelmvc.pojo.HotelPOJO;
import com.jspider.hotelmvc.service.AdminService;
import com.jspider.hotelmvc.service.GuestHistoryService;
import com.jspider.hotelmvc.service.HotelService;


@Controller
public class HotelController {

	@Autowired
	private HotelService service;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private GuestHistoryService historyService;

	// Home Controller
	@GetMapping("/home")
	public String home(@SessionAttribute(name = "login", required = false) AdminPOJO login, ModelMap map) {
		if (login != null) {
			List<HotelPOJO> guests = service.searchAllGuest();
			map.addAttribute("guestList", guests);
			return "Home";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}

	// Add Page Controller
	@GetMapping("/add")
	public String addPage(@SessionAttribute(name = "login", required = false) AdminPOJO login, ModelMap map) {
		if (login != null) {
			return "Add";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}

	// Add Data Controller
	@PostMapping("/add")
	public String add(@SessionAttribute(name = "login", required = false) AdminPOJO login, @RequestParam int room, @RequestParam String name,@RequestParam String city,@RequestParam String id_name, @RequestParam String id_no,
			@RequestParam String date_in, @RequestParam String date_out, ModelMap map) {
		if (login != null) {
			HotelPOJO find = service.searchGuest(room);
			if(find!=null) {
				map.addAttribute("msg", "Room No "+room+" is booked Select Empty Room..!!");
				return "Add";
			}
			HotelPOJO guest = service.addGuest(room,name,city,id_name,id_no,date_in,date_out);
			historyService.addGuestHistory(room, name, city, id_name, id_no, date_in, date_out);
			if (guest != null) {
				// Success response
				map.addAttribute("msg", "Guest Data added successfully..!!");
				return "Add";
			}
			// Failure response
			map.addAttribute("msg", " Guest Data not added successfully..!!");
			return "Add";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}

	// Search Data Controller
	@PostMapping("/search")
	public String search(@SessionAttribute(name = "login", required = false) AdminPOJO login, @RequestParam int id, ModelMap map) {
		if (login != null) {
			HotelPOJO guest = service.searchGuest(id);
			if (guest != null) {
				// Success response
				map.addAttribute("msg", "Guest Information..!!");
				map.addAttribute("guest", guest);
				return "Search";
			}
			// Failure response
			map.addAttribute("msg", "Guest Information Not Present..!!");
			return "Search";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}
	
	
	// Search Page Controller
	@GetMapping("/searchHistory")
	public String searchPage(@SessionAttribute(name = "login", required = false) AdminPOJO login, ModelMap map) {
		if (login != null) {
			List<GuestHistoryPOJO> guests = historyService.searchAll();
			map.addAttribute("guestList", guests);
			return "SearchHistory";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}

	
	@PostMapping("/searchHistory")
	public String searchHistory(@SessionAttribute(name = "login", required = false) AdminPOJO login, @RequestParam String text, ModelMap map) {
		if (login != null) {
			List<GuestHistoryPOJO> history = historyService.searchGuestHistory(text);
			if (history != null && !history.isEmpty()) {
				map.addAttribute("msg", "Guest Data found..!!");
				map.addAttribute("guestList", history);
				return "SearchHistory";
			}
			// Failure response
			map.addAttribute("msg", "Guest Data not found..!!");
			return "SearchHistory";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}

//	 Remove Page Controller
	@GetMapping("/remove")
	public String removePage(@SessionAttribute(name = "login", required = false) AdminPOJO login, ModelMap map) {
		if (login != null) {
			List<HotelPOJO> guests = service.searchAllGuest();
			map.addAttribute("guestList", guests);
			return "Remove";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}

	// Remove Data Controller
	@PostMapping("/remove")
	public String remove(@SessionAttribute(name = "login", required = false) AdminPOJO login, @RequestParam int id, ModelMap map) {
		if (login != null) {
			HotelPOJO guest = service.searchGuest(id);
			if (guest != null) {
				// Success response
				service.removeGuest(id);
				List<HotelPOJO> guests = service.searchAllGuest();
				map.addAttribute("guestList", guests);
				map.addAttribute("msg", "Data removed successfully..!!");
				return "Remove";
			}
			// Failure response
			List<HotelPOJO> guests = service.searchAllGuest();
			map.addAttribute("guestList", guests);
			map.addAttribute("msg", "Data does not exist..!!");
			return "Remove";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}
//	
	// Update Page Controller
	@GetMapping("/update")
	public String updatePage(@SessionAttribute(name = "login", required = false) AdminPOJO login, ModelMap map) {
		if (login != null) {
			List<HotelPOJO> guests = service.searchAllGuest();
			map.addAttribute("guestList", guests);
			return "Update";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}
//	
	// Update Form Controller
	@PostMapping("/update")
	public String updateForm(@SessionAttribute(name = "login", required = false) AdminPOJO login, @RequestParam int id, ModelMap map) {
		if (login != null) {
			HotelPOJO guest = service.searchGuest(id);
			if (guest != null) {
				//Success response
				map.addAttribute("guest", guest);
				return "Update";
			}
			//Failure response
			map.addAttribute("msg", "Data not found..!!");
			List<HotelPOJO> guests = service.searchAllGuest();
			map.addAttribute("guestList", guests);
			return "Update";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}

	// Update Data Controller
	@PostMapping("/updateData")
	public String update(@SessionAttribute(name = "login", required = false) AdminPOJO login,
			@RequestParam int room, @RequestParam String name,@RequestParam String city,@RequestParam String id_name, @RequestParam String id_no,
			@RequestParam String date_in, @RequestParam String date_out,
						ModelMap map) {
		if (login != null) {
			HotelPOJO guest = service.searchGuest(room);
			if (guest != null) {
				//Success response
				service.updateGuest(room,name,city,id_name,id_no,date_in,date_out);
				map.addAttribute("msg", "Data updated successfully..!!");
				List<HotelPOJO> guests = service.searchAllGuest();
				map.addAttribute("guestList", guests);
				return "Update";
			}
			//Failure response
			map.addAttribute("msg", "Data not updated..!!");
			return "Update";
		}
		map.addAttribute("msg", "Please login to proceed..!!");
		return "Login";
	}
//	
	//Create Admin Page Controller
	@GetMapping("/create")
	public String createAdminPage() {
		return "Admin";
	}
	
	//Create Admin Data Controller
	@PostMapping("/create")
	public String createAdmin(@RequestParam String username,
								@RequestParam String password,@RequestParam String user,@RequestParam String pass,
								ModelMap map) {
		AdminPOJO admin = adminService.addAdmin(username, password,user,pass);
		if (admin != null) {
			//Success response
			map.addAttribute("msg", "Account created successfully..!!");
			return "Login";
		}
		//Failure response
		map.addAttribute("msg", "Account not created..!!");
		return "Login";
	}
	
	//Login Controller
	@PostMapping("/login")
	public String login(@RequestParam String username,
						@RequestParam String password,
						ModelMap map,
						HttpServletRequest request) {
		AdminPOJO admin = adminService.login(username, password);
		if (admin != null) {
			//Success response
			List<HotelPOJO> guests = service.searchAllGuest();
			map.addAttribute("guestList", guests);
			HttpSession session = request.getSession();
			session.setAttribute("login", admin);
			return "Home";
		}
		//Failure response
		map.addAttribute("msg", "Invalid username or password");
		return "Login";
	}
	
	
	// Logout Controller
	@GetMapping("/logout")
	public String logout(ModelMap map, HttpSession session) {
		map.addAttribute("msg", "Logged out successfully..!!");
		session.invalidate();
		return "Login";
	}

}