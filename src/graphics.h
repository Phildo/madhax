#ifndef _GRAPHICS_H_
#define _GRAPHICS_H_

struct SDL_Surface;

class Graphics
{
  private:
    SDL_Surface* screen;
  public:
    Graphics();
    ~Graphics();

    void clear();
    void flip();

    int getHeight() const;
    int getWidth() const;
    SDL_Surface* getScreen() const;
};

#endif

