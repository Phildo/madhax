#include "graphics.h"

#include <SDL/SDL.h>
#include <SDL/SDL_image.h>

const int SCREEN_WIDTH = 640;
const int SCREEN_HEIGHT = 480;
const int SCREEN_BPP = 32; //bits-per-pixel

Graphics::Graphics()
{
  screen = SDL_SetVideoMode(SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_BPP, SDL_SWSURFACE);
  SDL_WM_SetCaption("madhax",NULL);
}

Graphics::~Graphics()
{
  SDL_FreeSurface(screen);
}

void Graphics::clear()
{
  SDL_FillRect(screen, &screen->clip_rect, SDL_MapRGB(screen->format, 0xFF, 0xFF, 0xFF));
}

void Graphics::flip()
{
  SDL_Flip(screen);
}

int Graphics::getWidth() const
{
  return SCREEN_WIDTH;
}

int Graphics::getHeight() const
{
  return SCREEN_HEIGHT;
}

SDL_Surface* Graphics::getScreen() const
{
  return screen;
}

