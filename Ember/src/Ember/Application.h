#pragma once

#include "Core.h"
#include "Ember/Window.h"
#include "Ember/Events/Event.h"

namespace Ember {

	class EMBER_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	private:
		std::unique_ptr<Window> m_Window;
		bool m_Running = true;
	};

	// To be defined in CLIENT
	Application* CreateApplication();

}
