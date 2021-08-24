#pragma once

#include "Core.h"
#include "Ember/Events/Event.h"

namespace Ember {

	class EMBER_API Application
	{
	public:
		Application();
		virtual  ~Application();

		void Run();
	};

	//To be defined in CLIENT
	Application* CreateApplication();
}

