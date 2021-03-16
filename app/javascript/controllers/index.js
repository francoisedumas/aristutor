import 'controllers'
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import { AbymeController } from "abyme"

const application = Application.start()
const context = require.context(".", true, /\.js$/)
application.load(definitionsFromContext(context))

application.register('abyme', AbymeController)