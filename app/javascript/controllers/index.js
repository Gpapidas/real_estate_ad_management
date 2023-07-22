// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import AreaSelectController from "./area_select_controller"
application.register("area-select", AreaSelectController)
