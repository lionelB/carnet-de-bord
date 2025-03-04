<script lang="ts">
	import { contractTypeFullKeys, focusThemeKeys } from '$lib/constants/keys';
	import {
		GetRefSituationsByThemeDocument,
		type NotebookFocus,
		UpdateNotebookFocusDocument,
	} from '$lib/graphql/_gen/typed-document-nodes';
	import { openComponent } from '$lib/stores';
	import { trackEvent } from '$lib/tracking/matomo';
	import { Button, Checkboxes, Radio } from '$lib/ui/base';
	import { mutation, operationStore, query } from '@urql/svelte';
	import { buildSituationOptions } from './focusOptionsBuilder';

	export let focus: Pick<NotebookFocus, 'id' | 'theme' | 'situations' | 'linkedTo'>;

	const refSituationStore = operationStore(GetRefSituationsByThemeDocument, { theme: focus.theme });
	query(refSituationStore);

	const updateNotebookFocusStore = operationStore(UpdateNotebookFocusDocument);
	const updateNotebookFocus = mutation(updateNotebookFocusStore);

	function initFormData() {
		return {
			linkedTo: focus.linkedTo,
			situations: focus.situations,
		};
	}

	const formData = initFormData();

	$: disabled = !formData.linkedTo && formData.situations?.length > 0;

	async function updateFocus() {
		trackEvent('pro', 'notebook', `update focus`);
		await updateNotebookFocus({
			id: focus.id,
			situations: formData.situations,
			linkedTo: formData.linkedTo,
		});
		close();
	}

	function close() {
		openComponent.close();
	}

	$: situationOptions = buildSituationOptions($refSituationStore.data?.refSituations);
</script>

<div class="flex flex-col gap-6">
	<div>
		<h1>Modifier l'axe de travail « {focusThemeKeys.byKey[focus.theme]} »</h1>
		<p class="mb-0">
			Veuillez renseigner les informations ci-dessous pour modifier l'axe de travail.
		</p>
	</div>
	<div>
		<h2 class="fr-h4 text-france-blue">Axe de travail</h2>
		<Radio
			caption={"Veuillez sélectionner le type de contrat intégrant l'axe de travail."}
			bind:selected={formData.linkedTo}
			options={contractTypeFullKeys.options}
		/>
	</div>
	<div>
		<h2 class="fr-h4 text-france-blue">Situation</h2>
		{#if situationOptions.length === 0}
			<p>Aucune situation ne correspond à ce thème.</p>
		{:else}
			<Checkboxes
				globalClassNames={'flex flex-row flex-wrap gap-4'}
				checkboxesCommonClassesNames={`!mt-0 w-5/12`}
				caption={''}
				bind:selectedOptions={formData.situations}
				options={situationOptions}
			/>
		{/if}
	</div>
	<div class="h-full flex-stretch">{' '}</div>
	<div class="flex flex-row gap-6">
		<Button {disabled} on:click={updateFocus}>Enregistrer</Button>
		<Button outline={true} on:click={close}>Annuler</Button>
	</div>
</div>
