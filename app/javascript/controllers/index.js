// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
import DynamicDaybarController from "./dynamic_daybar_controller"; // Importation du contrôleur

eagerLoadControllersFrom("controllers", application); // Chargement des autres contrôleurs

application.register("dynamic-daybar", DynamicDaybarController);
