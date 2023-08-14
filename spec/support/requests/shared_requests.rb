RSpec.shared_examples 'request_shared_spec' do |controller_name, field_count|
  let(:factory) { controller_name.classify.underscore.to_sym }
  let(:clazz) { controller_name.classify.constantize }

  describe 'GET /index' do
    it 'renders a successful response' do
      create(factory)
      get send("#{controller_name}_url")
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'returns a success response' do
      obj = create(factory)
      get send("#{controller_name.singularize}_url", obj), headers: headers, as: :json
      expect(response).to be_successful

    end
  end

  describe 'POST /create' do
    context 'with valid params' do
      it 'creates a new object' do
        params = params = {
          todo: {
            title: 'Test Title',
            status: 'Test Status',
            date: 'Test Date'
          }
        }

        expect do
          post(
            send("#{controller_name}_url"),
            headers: headers,
            params: params,
            as: :json
          )
        end.to change(clazz, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new object' do
        params = params = {
          todo: {
            title: nil,
          }
        }

        expect do
        post(
          send("#{controller_name}_url"),
          params: params,
          headers: headers,
          as: :json
        ) end.to change(clazz, :count).by(0)

      end
    end
  end

  describe 'PUT /update' do
    context 'with valid params' do
      it 'updates the requested object' do
        obj = create(factory)
        params = params = {
          todo: {
            title: Faker::Lorem.word,

          }
        }

        put(
          send("#{controller_name.singularize}_url", obj),
          headers: headers,
          params: params,
          as: :json
        )
        obj.reload

        expect(response).to have_http_status(:ok)

      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the object' do
        obj = create(factory)
        params = params = {
          todo: {
            title: nil,

          }
        }

        put(
          send("#{controller_name.singularize}_url", obj),
          headers: headers,
          params: params,
          as: :json
        )

        expect(response).to have_http_status(:unprocessable_entity)


      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested object' do
      obj = create(factory)
      expect {
        delete send("#{controller_name.singularize}_url", obj)
      }.to change(clazz, :count).by(-1)
    end

    it 'redirects to the objects list' do
      obj = create(factory)
      delete send("#{controller_name.singularize}_url", obj)
      expect(response).to redirect_to(send("#{controller_name}_url"))
    end
  end
end
