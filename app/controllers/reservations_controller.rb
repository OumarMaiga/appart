class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :confirmer]
  after_action :change_notification, only: [:show]

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create

    @location = params[:location_id]

    if user_signed_in?
      @reservation = current_user.reservations.new(location_id: params[:location_id], email: current_user.email, nom: params[:reservation][:nom], prenom: params[:reservation][:prenom], debut: params[:reservation][:debut], fin: params[:reservation][:fin], nombre_adulte: params[:reservation][:nombre_adulte], nombre_enfant: params[:reservation][:nombre_enfant], montant_paye: params[:reservation][:montant_paye])
    else
      @reservation = Reservation.new(location_id: params[:location_id], email: params[:reservation][:email], nom: params[:reservation][:nom], prenom: params[:reservation][:prenom], debut: params[:reservation][:debut], fin: params[:reservation][:fin], nombre_adulte: params[:reservation][:nombre_adulte], nombre_enfant: params[:reservation][:nombre_enfant], montant_paye: params[:reservation][:montant_paye])
    end

    respond_to do |format|
      if @reservation.save
        # Mise à jour du compte user
=begin
        if user_signed_in?
          current_user.update(nom: params[:reservation][:nom], prenom: params[:reservation][:prenom], telephone: params[:reservation][:telephone])
        end
=end
        format.html { redirect_to @reservation, notice: "Un mail de confirmation  vous sera envoyer a l'adresse #{@reservation.email}" }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { redirect_to location_path(@location), alert: 'Reservation non effection.' }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_reservation
    @reservations = current_user.reservations.all
  end

  def confirmer
    @reservation.update(confirmer: :true)
    ReservationMailer.reservation_confirmer(@reservation).deliver_now
    respond_to do |format|
      format.html { redirect_to @reservation, notice: "Un mail confirmation sera envoyé à #{@reservation.email}" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:location_id, :email, :user_id, :nom, :prenom, :telephone, :debut, :fin, :nombre_adulte, :nombre_enfant, :montant_paye)
    end

    def change_notification
      if Admin?
        Notification.find_by_reservation_id(@reservation.id).update(vue: true)
      end
    end
end
