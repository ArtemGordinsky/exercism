defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune

  @earth_orbital_period 31_557_600
  @age_relative_to_earth %{
    :mercury => 0.2408467,
    :venus => 0.61519726,
    :mars => 1.8808158,
    :jupiter => 11.862615,
    :saturn => 29.447498,
    :uranus => 84.016846,
    :neptune => 164.79132
  }



  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on Earth.
  """
  @spec age_on(:earth, pos_integer) :: float
  def age_on(:earth, seconds) do
    seconds / @earth_orbital_period
  end

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    age_on(:earth, seconds) / @age_relative_to_earth[planet]
  end
end
